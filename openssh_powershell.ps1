# OpenSSH Installation and Configuration Script for Windows 11
# Run this in PowerShell as Administrator

# Check if running as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script requires Administrator privileges. Restarting PowerShell as Admin..." -ForegroundColor Yellow
    Start-Process pwsh -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}

Write-Host "=== OpenSSH Client Setup ===" -ForegroundColor Cyan

# 1. Install OpenSSH Client if not installed
$sshClientInstalled = Get-WindowsCapability -Online | Where-Object { $_.Name -like 'OpenSSH.Client*' -and $_.State -eq 'Installed' }

if (-not $sshClientInstalled) {
    Write-Host "Installing OpenSSH Client..." -ForegroundColor Yellow
    $installResult = Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
    
    if ($installResult.RestartNeeded) {
        Write-Host "Installation completed but requires a restart. Please restart your computer and run this script again." -ForegroundColor Yellow
        pause
        exit
    }
    
    Write-Host "OpenSSH Client successfully installed." -ForegroundColor Green
} else {
    Write-Host "OpenSSH Client is already installed." -ForegroundColor Green
}

# 2. Verify SSH is in PATH
$sshPath = (Get-Command ssh -ErrorAction SilentlyContinue).Source

if (-not $sshPath) {
    Write-Host "SSH not found in PATH. Adding to PATH..." -ForegroundColor Yellow
    
    # Add OpenSSH to User PATH
    $userPath = [Environment]::GetEnvironmentVariable('PATH', 'User')
    if (-not $userPath.Contains('System32\OpenSSH')) {
        [Environment]::SetEnvironmentVariable(
            'PATH',
            $userPath + ';C:\Windows\System32\OpenSSH',
            'User'
        )
        Write-Host "Added OpenSSH to User PATH. You may need to restart PowerShell for changes to take effect." -ForegroundColor Green
    }
    
    # Verify System PATH (just in case)
    $systemPath = [Environment]::GetEnvironmentVariable('PATH', 'Machine')
    if (-not $systemPath.Contains('System32\OpenSSH')) {
        [Environment]::SetEnvironmentVariable(
            'PATH',
            $systemPath + ';C:\Windows\System32\OpenSSH',
            'Machine'
        )
        Write-Host "Added OpenSSH to System PATH." -ForegroundColor Green
    }
} else {
    Write-Host "SSH is already available at: $sshPath" -ForegroundColor Green
}

# 3. Final verification
Write-Host "`n=== Verification ===" -ForegroundColor Cyan
try {
    $sshVersion = & ssh -V 2>&1
    Write-Host "SSH is working! Version: $sshVersion" -ForegroundColor Green
} catch {
    Write-Host "SSH command failed. You may need to restart your computer." -ForegroundColor Red
}

Write-Host "`nSetup complete. Try your SSH command again!" -ForegroundColor Cyan
pause
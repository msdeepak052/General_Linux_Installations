# Procedures 
## 1. Openshell Powershell Steps

### How to Use This Script:

  - Save it as install_openssh.ps1
  - Run as Administrator:
 

  ```powershell
  Set-ExecutionPolicy RemoteSigned -Scope Process -Force
  .\install_openssh.ps1
  ```
 - After running, restart PowerShell if prompted
- Verification
  Test that SSH is working:

  ```powershell
  ssh -V
  Get-Command ssh
  ```


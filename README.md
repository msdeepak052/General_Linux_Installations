# Procedures 
## Openshell Powershell Steps

### How to Use This Script:

  - Save it as install_openssh.ps1
  - Run as Administrator:
  - After running, restart PowerShell if prompted

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process -Force
.\install_openssh.ps1
```
- Verification
  Test that SSH is working:

  ```powershell
  ssh -V
  Get-Command ssh
  ```


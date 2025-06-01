Set-Content -Path "..\PSNixOS\PSNixOS.psm1" -Value ''
Get-ChildItem -Path "..\PSNixOS\Public" -Filter *.ps1 | Get-Content | Add-Content -Path ..\PSNixOS\PSNixOS.psm1
Add-Content -Path "..\PSNixOS\PSNixOS.psm1" -Value "Export-ModuleMember -Function *"
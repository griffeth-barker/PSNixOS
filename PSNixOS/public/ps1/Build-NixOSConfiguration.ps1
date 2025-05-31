function Build-NixOSConfiguration {
  <#
  .SYNOPSIS
    Verifies the NixOS configuration file.

  .DESCRIPTION
    This function verifies the NixOS configuration file can be built.

  .EXAMPLE
    # Build the NixOS configuration file to validate its contents
    Build-NixOsConfiguration

  .NOTES
    Requirements:
  - Operating System: "NixOS"
  - Packages:
    - "powershell"
    - "nixos-rebuild"
  - Permissions: +rw at /etc/nixos
  #>

  Write-Information "Building NixOS configuration file"
  Invoke-Expression 'sudo nixos-rebuild build' # TODO: Invoke-Expression is not ideal; a better solution should be implemented in the future.

}
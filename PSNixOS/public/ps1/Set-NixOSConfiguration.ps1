function Set-NixOSConfiguration {
  <#
  .SYNOPSIS
    Applies the NixOS configuration.

  .DESCRIPTION
    This function applies the NixOS configuration file.

  .EXAMPLE
    # Apply the NixOS configuration
    Set-NixOsConfiguration

  .NOTES
    Requirements:
  - Operating System: "NixOS"
  - Packages:
    - "powershell"
    - "nixos-rebuild"
  - Permissions: +rw at /etc/nixos
  #>

  [CmdletBinding(SupportsShouldProcess = $true)]
  param ()

  if ($PSCmdlet.ShouldProcess("System", "Apply NixOS configuration with 'nixos-rebuild switch'")) {
    Write-Information "Applying NixOS configuration; changes will persist following reboot."
    Invoke-Expression 'sudo nixos-rebuild switch' # TODO: Invoke-Expression is not ideal; a better solution should be implemented in the future.
  }

}
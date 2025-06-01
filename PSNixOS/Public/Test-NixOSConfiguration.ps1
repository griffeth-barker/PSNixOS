function Test-NixOSConfiguration {
  <#
  .SYNOPSIS
    Tests the NixOS configuration.

  .DESCRIPTION
    This function tests the NixOS configuration by temporarily applying it.
    Changes are reverted following reboot.

 .EXAMPLE
    # Test the NixOS configuration
    Test-NixOsConfiguration

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

  if ($PSCmdlet.ShouldProcess("System", "Test NixOS configuration with 'nixos-rebuild test'")) {
    Write-Information "Testing NixOS configuration; changes will revert following reboot."
    Invoke-Expression 'sudo nixos-rebuild test' # TODO: Invoke-Expression is not ideal; a better solution should be implemented in the future.
  }

}
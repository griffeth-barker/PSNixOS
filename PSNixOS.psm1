
function Backup-NixOSConfiguration {
  <#
  .SYNOPSIS
    Creates a backup of the NixOS configuration.

  .DESCRIPTION
    This function creates a backup copy of the NixOS configuration file.

  .PARAMETER Destination
    An option string containing the destination filesystem path for the backed up configuration file.

  .EXAMPLE
    # Back up the NixOS configuration file to the default location
    # The default configuration location is `/etc/nixos/`
    Backup-NixOsConfiguration

  .EXAMPLE
    # Back up the NixOS configuration file to a custom location
    # The provided value must begin and end with `/` ; this will be checked at runtime.
    Backup-NixOsConfiguration -Destination /home/Documents/

  .NOTES
    Requirements:
      - Operating System: "NixOS"
      - Packages:
        - "powershell"
        - "nixos-rebuild"
      - Permissions: +rw at /etc/nixos
  #>

  [CmdletBinding(SupportsShouldProcess = $true, DefaultParameterSetName = 'None')]
  param (
      [Parameter(Mandatory = $true)]
      [ValidatePattern('^/.*/$')]
      [string]$Destination
  )

  if ($Destination) {
    Write-Information "Creating backup copy of configuration.nix in default location."
    $fullBackupPath = (
      @(
        "$Destination",
        "configuration_",
        "$(Get-Date -Format 'yyyyMMdd_hhmmss')",
        ".nix.bak"
      ) -join ''
    ).ToString()

    Write-Information "Creating backup copy of configuration.nix in $fullBackupPath."
    Copy-Item -Path '/etc/nixos/configuration.nix' -Destination "$fullBackupPath"
  }
  else {
    Write-Information "Creating backup copy of configuration.nix in $Destination."
    Copy-Item -Path '/etc/nixos/configuration.nix' -Destination "/etc/nixos/configuration_$(Get-Date -Format 'yyyyMMdd_hhmmss').nix.bak"
  }

}
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
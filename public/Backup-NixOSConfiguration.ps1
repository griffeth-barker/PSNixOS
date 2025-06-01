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
# Backup-NixOSConfiguration

## Synopsis
Creates a backup of the NixOS configuration.

## Description
This function creates a backup copy of the NixOS configuration file.

## Parameters
### Destination
The destination filesystem path for the backed up configuration file.

Type: String
Mandatory: False
Position: Named

## Examples
### Back up the NixOS configuration file to the default location
The default configuration location is `/etc/nixos/`
```PowerShell
Backup-NixOSConfiguration
```
### Back up the NixOS configuration file to a custom location
The provided value must begin and end with "/"; this will be checked at runtime.

```PowerShell
Backup-NixOSConfiguration -Destination /home/Documents/
```

## Notes
Requirements:
  - Operating System: "NixOS"
  - Packages:
    - "powershell"
    - "nixos-rebuild"
  - Permissions: +rw at /etc/nixos
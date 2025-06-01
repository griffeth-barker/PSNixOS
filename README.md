# PSNixOS  
![](images\psnixos-icon-128x128.png)  
PSNixOS is a basic and unofficial PowerShell module for verifying, testing, and applying your NixOS configuration file.  
  
Do you use PowerShell as your primary shell on NixOS? Does it feel wrong to type Linux commands into your PowerShell command-line?  
These functions are for you. Is this important? Nope! But it feels better to me, so it exists.  
  
## Getting Started  
### Get the Module
[![PSGallery Version](https://img.shields.io/powershellgallery/v/PSNixOS.png?style=for-the-badge&label=PowerShell%20Gallery)](https://www.powershellgallery.com/packages/PSNixOS/) [![PSGallery Downloads](https://img.shields.io/powershellgallery/dt/PSNixOS.png?style=for-the-badge&label=Downloads)](https://www.powershellgallery.com/packages/PSNixOS/)  
  
You can install the module from the PowerShell Gallery.
  
```PowerShell
# Install using Microsoft.PowerShell.PSResourceGet module, which is PowerShellGet's successor.
Install-PSResource -Name PSNixOS -Repository PSGallery

# Install using PowerShellGet module, which is no longer in active development.
# Install-Module -Name PSNixOS -Repository PSGallery
```  
  
### Explore Functions
Once you've imported the module, get started by using `Get-Command -Module PSNixOS` to discover the functions, or by reading the [docs](/docs).
  
## Feedback  
Please ⭐ star this repository if it is helpful. Constructive feedback is always welcome, as are pull requests. Feel free to open an issue on the repository if needed or [send me a message on Signal](https://griff.systems/signal).  

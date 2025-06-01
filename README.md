# PsNixOs  
A basic PowerShell module for verifying, testing, and applying your NixOS configuration file.  
  
Do you use PowerShell as your primary shell on NixOs? Does it feel wrong to type Linux commands into your PowerShell command-line?  
These functions are for you. Is this important? Nope! But it feels better to me, so it exists.  
  
## Getting Started  
Clone this repository:  
```
git clone https://github.com/griffeth-barker/PSNixOS.git
```  
  
### Option 1: Install from the PowerShell Gallery  
You can install the module from the PowerShell Gallery:  
```PowerShell
Install-Module -Name PSNixOS -Repository PSGallery
```  
  
### Option 2: Manually download and import  
You can import the module as follows:  
```PowerShell
Import-Module -Path ./PSNixOS.psd1
```  
  
### Option 3: Manually download and dot-source  
Alternatvely, you may dot-source each of the functions manually:  
```PowerShell
Get-ChildItem | ForEach-Object {
  . $_
}
```  
  
Once you've imported the module, get started with `Get-Command -Module PSNixOS` or by reading the [docs](/docs).
  
## Feedback  
Please ⭐ star this repository if it is helpful. Constructive feedback is always welcome, as are pull requests. Feel free to open an issue on the repository if needed or [send me a message on Signal](https://griff.systems/signal).  

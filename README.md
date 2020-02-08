# idenv
Set up your computer application and environment.

## Usage

Use the PowerShell5 to run idenv. It run may exit powershell.

```powershell
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/o-samurai/idenv/master/idenv.ps1')

# or shorter
iwr -useb https://raw.githubusercontent.com/o-samurai/idenv/master/idenv.ps1 | iex
```

## Install applications

- [Scoop](https://github.com/lukesampson/scoop)
<!--
 - [aria2](https://github.com/aria2/aria2)
 - [7zip](https://www.7-zip.org/)
 - [git](https://gitforwindows.org/)
 - [github](https://desktop.github.com/)
 - [vscode](https://code.visualstudio.com/)
-->
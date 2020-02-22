# idenv
Set up your computer application and environment.

## Prerequisite

- Windows 10 Pro or Windows 10 Enterprise.
    - PowerShell 5
    - OpenSSH Client
- [Virtualbox](https://www.virtualbox.org/) for environment on vagrant.

## Usage

Use the PowerShell5 to run idenv. It run may exit powershell.

```powershell
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/o-samurai/idenv/master/script/idenv.ps1')

# or shorter
iwr -useb https://raw.githubusercontent.com/o-samurai/idenv/master/script/idenv.ps1 | iex
```

## Install applications

- [Scoop](https://github.com/lukesampson/scoop)
    - [aria2](https://github.com/aria2/aria2)
    - [7zip](https://www.7-zip.org/)
    - [git](https://gitforwindows.org/)
    - [github](https://desktop.github.com/)
    - [vscode](https://code.visualstudio.com/)
        - ms-vscode.powershell
    - [vagrant](https://www.vagrantup.com/)
        * \*To use Vagrant, you must ensure the Hyper-V is disabled. [See vagrant installtion description.](https://www.vagrantup.com/docs/installation/)\*
        - [generic/centos8](https://app.vagrantup.com/generic/boxes/centos8) (disabled)
            - [ansible](https://www.ansible.com/)
            * docker is unavailable.
        - [generic/centos7](https://app.vagrantup.com/generic/boxes/centos7) (default)
            - [ansible](https://www.ansible.com/)
            - [docker](https://www.docker.com/)


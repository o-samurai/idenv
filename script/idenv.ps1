function setupVirutalEnvironmentByVagrant(){
    mkdir $env:USERPROFILE\vagrantenv\centos8
    Set-Location $env:USERPROFILE\vagrantenv\centos8
    vagrant init generic/centos8
}

function setupVscodeExtensions(){
    code --install-extension ms-vscode.powershell
}

function main(){
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

    scoop install aria2
    scoop bucket add extras
    scoop install git
    scoop install github
    scoop install vscode
    setupVscodeExtensions
    scoop install vagrant
    setupVirutalEnvironmentByVagrant
}

main

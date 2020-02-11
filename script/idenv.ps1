function setupVirutalEnvironmentByVagrant(){
    mkdir $env:USERPROFILE\vagrantenv\centos8
    Set-Location $env:USERPROFILE\vagrantenv\centos8
    vagrant init generic/centos8
    # Download
    (New-Object Net.Webclient).downloadFile('https://raw.githubusercontent.com/o-samurai/idenv/master/resource/vagrant/centos8/Vagrantfile',"$env:USERPROFILE\vagrantenv\centos8\Vagrantfile")
    Set-Location $env:USERPROFILE
}

function setupVscodeExtensions(){
    code --install-extension ms-vscode.powershell
    code --install-extension editorconfig.editorconfig
}

function install(){
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

install

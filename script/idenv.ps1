function integrateVscodeRemoteDevAndVagrantVirtualEnv(){
    Set-Location $env:USERPROFILE\vagrantenv\centos8
    vagrant ssh-config > $env:USERPROFILE/.ssh/config
    Set-Location $env:USERPROFILE
}

function setupVirutalEnvironmentByVagrant(){
    mkdir $env:USERPROFILE\vagrantenv\centos8
    Set-Location $env:USERPROFILE\vagrantenv\centos8
    vagrant init generic/centos8
    # Download
    (New-Object Net.Webclient).downloadFile('https://raw.githubusercontent.com/o-samurai/idenv/master/resource/vagrant/centos8/Vagrantfile',"$env:USERPROFILE\vagrantenv\centos8\Vagrantfile")
    (New-Object Net.Webclient).downloadFile('https://raw.githubusercontent.com/o-samurai/idenv/master/resource/vagrant/centos8/playbook.yml',"$env:USERPROFILE\vagrantenv\centos8\playbook.yml")
    Set-Location $env:USERPROFILE
}

function setupVscodeExtensions(){
    code --install-extension ms-vscode.powershell
    code --install-extension ms-vscode-remote.vscode-remote-extensionpack
    code --install-extension editorconfig.editorconfig
    code --install-extension eamodio.gitlens
    code --install-extension jebbs.plantuml
}

function installByScoop(){
    scoop install aria2
    scoop bucket add extras
    scoop install git
    scoop install github
    scoop install notepadplusplus
    scoop install vscode
    scoop install vagrant
}

function install(){
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
    installByScoop
    setupVscodeExtensions
    setupVirutalEnvironmentByVagrant
    integrateVscodeRemoteDevAndVagrantVirtualEnv
}

install

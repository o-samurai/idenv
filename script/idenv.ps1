function integrateVscodeRemoteDevAndVagrantVirtualEnv(){
    Set-Location $env:USERPROFILE\vagrantenv\centos8
    vagrant ssh-config > $env:USERPROFILE/.ssh/config
    Set-Location $env:USERPROFILE
}

function setupCentos7OnVagrant(){
    mkdir $env:USERPROFILE\vagrantenv\centos7
    Set-Location $env:USERPROFILE\vagrantenv\centos7
    vagrant init generic/centos7
    # Download
    (New-Object Net.Webclient).downloadFile(
        'https://raw.githubusercontent.com/o-samurai/idenv/master/resource/vagrant/centos7/Vagrantfile',
        "$env:USERPROFILE\vagrantenv\centos7\Vagrantfile")
    (New-Object Net.Webclient).downloadFile(
        'https://raw.githubusercontent.com/o-samurai/idenv/master/resource/vagrant/centos7/playbook.yml',
        "$env:USERPROFILE\vagrantenv\centos7\playbook.yml")
    Set-Location $env:USERPROFILE
}

function setupCentos8OnVagrant(){
    mkdir $env:USERPROFILE\vagrantenv\centos8
    Set-Location $env:USERPROFILE\vagrantenv\centos8
    vagrant init generic/centos8
    # Download
    (New-Object Net.Webclient).downloadFile(
        'https://raw.githubusercontent.com/o-samurai/idenv/master/resource/vagrant/centos8/Vagrantfile',
        "$env:USERPROFILE\vagrantenv\centos8\Vagrantfile")
    (New-Object Net.Webclient).downloadFile(
        'https://raw.githubusercontent.com/o-samurai/idenv/master/resource/vagrant/centos8/playbook.yml',
        "$env:USERPROFILE\vagrantenv\centos8\playbook.yml")
    Set-Location $env:USERPROFILE
}

function setupVirutalEnvironmentByVagrant(){
    # setupCentos8OnVagrant
    setupCentos7OnVagrant
}

function setupVscode(){
    # Install extensions
    code --install-extension ms-vscode.powershell
    code --install-extension ms-vscode-remote.vscode-remote-extensionpack
    code --install-extension editorconfig.editorconfig
    code --install-extension eamodio.gitlens
    code --install-extension jebbs.plantuml
    # Configure settings
    cscript /nologo /e:JScript vscodeconfiguration.js $env:USERPROFILE\AppData\Roaming\Code\User\settings.json ..\resource\vscode\disablepreview.json
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
    setupVscode
    setupVirutalEnvironmentByVagrant
    integrateVscodeRemoteDevAndVagrantVirtualEnv
}

install

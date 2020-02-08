function main(){
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

$ErrorActionPreference = "stop"

main

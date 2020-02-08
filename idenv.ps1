function main(){
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

$err=0
$ErrorActionPreference = "stop"

try{
    $err = main
} catch [Exception] {
    $err = 1
}

exit $err

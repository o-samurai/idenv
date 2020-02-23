// This file is for CScript.
// usage: CScript.exe vscodeconfiguration.js <target vscode settings.json path> <setting entry json path>

var settingsjsonpath = WScript.Arguments(0);
var entryjsonpath = WScript.Arguments(1);
var fso = new ActiveXObject('Scripting.FileSystemObject');
var htmlfile = WSH.CreateObject('htmlfile');
htmlfile.write('<meta http-equiv="x-ua-compatible" content="IE=11" />');
var JSON = htmlfile.parentWindow.JSON;

// Return a string of textfile.
function readAll(textfile) {
    var text = "";
    while(!textfile.AtEndOfStream){
        text+=textfile.read(1024);
    }
    textfile.Close();
    return text;
}

// merge json
function merge(source, target){
    var key = null;
    for(key in source){
        if(source.hasOwnProperty(key)){
            target[key] = source[key];
        }
    }
}

var settingsjson = readAll(fso.OpenTextFile(settingsjsonpath, 1));
var entryjson = readAll(fso.OpenTextFile(entryjsonpath, 1));

settingsjson = JSON.parse(settingsjson);
entryjson = JSON.parse(entryjson);

// merge settingsjson and entryjson to mergedjson.
var mergedjson = {};
merge(settingsjson, mergedjson);
merge(entryjson, mergedjson);

mergedjson = JSON.stringify(mergedjson, null, '    ')
WScript.Echo(mergedjson);

// output to settingsjsonpath.
var targetfile = fso.OpenTextFile(settingsjsonpath, 2);
targetfile.WriteLine(mergedjson);
targetfile.Close();

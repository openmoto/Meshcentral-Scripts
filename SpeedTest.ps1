$program = "speedtest"
$path = $env:PROGRAMDATA
$app = Join-Path -Path $path -ChildPath $program
$speedtest = Join-Path -Path $app -ChildPath $program".exe"

if (!(Test-Path $speedtest -PathType Leaf)) {
	$path = 'https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-1.0.0-win64.zip'
	$dl = $env:temp+'\'+$program
	Invoke-WebRequest $path -OutFile $dl".zip"
	Expand-Archive -LiteralPath $dl".zip" -DestinationPath $dl
	Move-item –path $dl –destination $folder
}

$a = ((& $speedtest --accept-license) |select-object -skip 5) 
$result = $a -replace ": ","=" | ConvertFrom-StringData
$result

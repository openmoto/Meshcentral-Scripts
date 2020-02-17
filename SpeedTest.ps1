<#
	.NOTES
	===========================================================================
	 Created on:   	17-Feb-20 2:02 AM
	 Created by:   	Michael Agu
	 Organization: 	ClockWorx IT
	 Filename:     	SpeedTest.ps1
	===========================================================================
	.DESCRIPTION
	
	This script downloads ookla speedtest command line version and runs on the selected computer
	https://www.speedtest.net/about/eula
	https://www.speedtest.net/about/terms
	While using meshcentral-scripttask, the result will display in the script history and node history
	Example Result Below

	Name Value
	---- -----
	Latency 9.40 ms (0.94 ms jitter)
	Download 103.62 Mbps (data used=111.1 MB)
	Upload 16.10 Mbps (data used=12.5 MB)
	Packet Loss 0.0%
	Result URL https://www.speedtest.net/result/c/fac338ea-0f15-4064-8bf9-dac045bfb04c
#>


$program = "speedtest"
$path = $env:PROGRAMDATA
$app = Join-Path -Path $path -ChildPath $program
$speedtest = Join-Path -Path $app -ChildPath $program".exe"

if (!(Test-Path $speedtest -PathType Leaf))
{
	$path = 'https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-1.0.0-win64.zip'
	$dl = $env:temp + '\' + $program
	Invoke-WebRequest $path -OutFile $dl".zip"
	Expand-Archive -LiteralPath $dl".zip" -DestinationPath $dl
	Move-item -path $dl -destination $folder
}

$a = ((& $speedtest --accept-license) | select-object -skip 5)
$result = $a -replace ": ", "=" | ConvertFrom-StringData
$result

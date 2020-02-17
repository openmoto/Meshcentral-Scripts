<#
	.NOTES
	===========================================================================
	 Created on:   	17-Feb-20 11:02 PM
	 Created by:   	Michael Agu
	 Organization: 	ClockWorx IT
	 Filename:     	Get-SmartStatus.ps1
	===========================================================================
	.DESCRIPTION
	This script will perform quick cleanup of windows devices and return the disk space before and after cleanup
#>


$drive = $env:SystemDrive -replace ":",""
$before = Get-PSDrive -Name $drive
$before.Free
$tempfolders = @('C:\Windows\Temp\*', 'C:\Windows\Prefetch\*', 'C:\Documents and Settings\*\Local Settings\temp\*', 'C:\Users\*\Appdata\Local\Temp\*')
Remove-Item $tempfolders -force -recurse -ErrorAction SilentlyContinue
$after = Get-PSDrive -Name $drive
$after.free

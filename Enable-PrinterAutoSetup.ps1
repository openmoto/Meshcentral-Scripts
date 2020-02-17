<#
	.NOTES
	===========================================================================
	 Created on:   	17-Feb-20 7:22 PM
	 Created by:   	Michael Agu
	 Organization: 	ClockWorx IT
	 Filename:     	Stop-PrinterAutoInstall.ps1
	===========================================================================
	.DESCRIPTION
	Windows 10 by default can find and install network printers automatically, 
	this can be great for home use but could be a problem in a work environment where you have multiple printers of the same model
	This script enables auto-setup of network devices on Windows 10 allowing it to automatically install any printer it finds on your network.
	Originally shared on Spiceworks: https://community.spiceworks.com/scripts/show/4534-disable-and-enable-automatic-setup-of-network-devices-windows-10
#>

Function Start-PrinterAutoInstall
{
	$PrinterInstall = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private" -Name "AutoSetup"
	if ($PrinterInstall.AutoSetup -ne 1)
	{
		Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private" -Name "AutoSetup" -Value 1
		Write-Host "Printer AutoSetup enabled"
	}
	Else { Write-Host "Printer AutoSetup already Enabled" }
}
Start-PrinterAutoInstall
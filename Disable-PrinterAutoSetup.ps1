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
	This script disables auto-setup of network devices on Windows 10 allowing you install only the printers you need
	Originally shared on Spiceworks: https://community.spiceworks.com/scripts/show/4534-disable-and-enable-automatic-setup-of-network-devices-windows-10
#>


Function Stop-PrinterAutoInstall
{
	
	New-Item "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private" -Force | New-ItemProperty -Name "AutoSetup" -Value 0 -Force | Out-Null
	
	$PrinterInstall = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private" -Name "AutoSetup"
	
	if ($PrinterInstall.AutoSetup -eq 0)
	{
		Write-Host "Printer AutoSetup Disabled"
	}
	
	Else { Write-Host "Printer AutoSetup still enabled, please setup manually" }
}

Stop-PrinterAutoInstall
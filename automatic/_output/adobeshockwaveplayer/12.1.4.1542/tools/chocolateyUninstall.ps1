$packageName = 'adobeshockwaveplayer'
$installerType = 'EXE'
$silentArgs = '/S'
$processor = Get-WmiObject Win32_Processor
$is64bit = $processor.AddressWidth -eq 64
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

try {

	if ($is64bit) {
		$unpath = "C:\Windows\SysWOW64\Adobe\Shockwave 12\uninstaller.exe"
	} else {
		$unpath = "C:\Windows\System32\Adobe\Shockwave 12\uninstaller.exe"
	}
  
	Uninstall-ChocolateyPackage $packageName $installerType $silentArgs $unpath -validExitCodes $validExitCodes
    
	Write-ChocolateySuccess $packageName
	
} catch {
	Write-ChocolateyFailure $packageName $($_.Exception.Message)
	throw 
}
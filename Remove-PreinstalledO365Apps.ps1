$AppList = "Microsoft OneNote","Microsoft 365"
$LanguageList = "en-us","es-es","fr-fr","pt-br"

ForEach ($App in $AppList) {

	ForEach ($Language in $LanguageList) {
		$AppName = "$App - $Language"
		$OneNote = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -eq $AppName } | Select-Object -Property DisplayName,UninstallString
	    $uninst = $OneNote.uninstallstring + " displaylevel=false"

	    Start-Process -WindowStyle Hidden cmd.exe -ArgumentList '/c', $uninst -Wait -PassThru
	}
}
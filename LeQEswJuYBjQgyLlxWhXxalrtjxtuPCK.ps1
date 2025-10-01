$connectTestResult = Test-NetConnection -ComputerName bpionpremfileserverstrg.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"bpionpremfileserverstrg.file.core.windows.net`" /user:`"localhost\bpionpremfileserverstrg`" /pass:`"HEio36hz1ohxfJqmTWGCfEeE6YV2bGIz6Js2yPGXuzuJkxLZklPpAd1fMqSzt+4CQtRb1L7NVmo7+AStIhUBkw==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\bpionpremfileserverstrg.file.core.windows.net\bpfile02" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}

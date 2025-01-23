if ((gwmi win32_operatingsystem | select osarchitecture).osarchitecture -eq "64-bit")
 { 
#64 bit TeamViewer Uninstall 
Start-Process -FilePath "C:\Program Files\WinRAR\uninstall.exe" /s 
  #32 bit TeamViewer Uninstall 
Start-Process -Filepath "-file C:\Program Files (x86)\WinRAR\uninstall.exe" /s 
 } 
 # سكربت لتحميل وتثبيت مع تعريف الطابعات ، Chrome، و 7-Zip
# يجب تشغيل هذا السكربت بصلاحيات المسؤول (Run as Administrator)
# ==== إعداد المتغيرات ====


# استيراد الوحدة الخاصة بتحديثات Windows
Install-Module PSWindowsUpdate -Force -SkipPublisherCheck

# التحقق من التحديثات المتاحة
Get-WindowsUpdate



# ==== إضافة الكيبورد العربي مع الاحتفاظ باللغة الإنجليزية كلغة واجهة ====
Write-Host "Adding Arabic Keyboard and setting English as the display language..." -ForegroundColor Yellow
Set-WinUserLanguageList -LanguageList "en-US", "ar-SA" -Force
Set-WinUILanguageOverride -Language "en-US" # واجهة النظام باللغة الإنجليزية

# ==== ضبط تنسيق التاريخ والوقت ====
Write-Host "Setting Date and Time Format to dd/MM/yyyy..." -ForegroundColor Yellow
Set-Culture -CultureInfo "en-US" # اللغة الإنجليزية مع تنسيق التاريخ الأوروبي
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortDate -Value "dd/MM/yyyy"
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sLongDate -Value "dd/MM/yyyy"

# ==== ضبط المنطقة الزمنية تلقائيًا ====
Write-Host "Setting Time Zone Automatically..." -ForegroundColor Yellow
Set-TimeZone -Id (Get-TimeZone).Id

Write-Host "Configuration Completed!" -ForegroundColor Green

# تمكين TLS 1.2 (لضمان التحميل الآمن)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# مسار مؤقت للتحميل
$tempPath = "$env:TEMP\Installers"
if (-not (Test-Path -Path $tempPath)) {
    New-Item -ItemType Directory -Path $tempPath | Out-Null
}

# وظيفة لتحميل الملفات
function Download-File($url, $outputPath) {
    Write-Host "Downloading: $url"
    Invoke-WebRequest -Uri $url -OutFile $outputPath -UseBasicParsing
    Write-Host "Downloaded to: $outputPath"
}


# 2. تحميل وتثبيت Google Chrome
$chromeUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$chromeInstaller = "$tempPath\chrome_installer.exe"
Download-File -url $chromeUrl -outputPath $chromeInstaller
Start-Process -FilePath $chromeInstaller -ArgumentList "/silent /install" -Wait

# 3. تحميل وتثبيت 7-Zip
$sevenZipUrl = "https://www.7-zip.org/a/7z2301-x64.exe" # استبدل بالرابط الصحيح إذا كنت تريد نسخة 32 بت
$sevenZipInstaller = "$tempPath\7zInstaller.exe"
Download-File -url $sevenZipUrl -outputPath $sevenZipInstaller
Start-Process -FilePath $sevenZipInstaller -ArgumentList "/S" -Wait

# تنظيف الملفات المؤقتة
Remove-Item -Path $tempPath -Recurse -Force

Write-Host "Installation Completed Successfully!"
# إعداد المتغيرات
$url = "https://ftp.hp.com/pub/softlib/software13/printers/UPD/upd-pcl6-x64-7.3.0.25919.zip"
$zipPath = "C:\Temp\upd-pcl6-x64-7.3.0.25919.zip"
$extractPath = "C:\Temp\HP_UPD"

# إنشاء المجلد المؤقت
New-Item -ItemType Directory -Path "C:\Temp" -Force

# تحميل الملف المضغوط
Invoke-WebRequest -Uri $url -OutFile $zipPath

# فك ضغط الملف
Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

# تثبيت ملف INF (استبدل 'hpcu118u.inf' باسم ملف INF الموجود في الحزمة)
$infPath = (Get-ChildItem -Path $extractPath -Recurse -Filter "*.inf").FullName
foreach ($path in $infPath) {
    pnputil.exe -i -a $path
}



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
    ======================"
}

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
    
    
# تثبيت التحديثات -AutoReboot
Install-WindowsUpdate -AcceptAll 
# فحص التحديثات المتاحة
Invoke-WUJob -Action Scan

# تثبيت التحديثات المتاحة
Invoke-WUJob -Action Install


# تمكين التحديثات التلقائية
Set-Service -Name wuauserv -StartupType Automatic
Start-Service -Name wuauserv
$officeSetupUrl = "https://c2rsetup.officeapps.live.com/c2r/download.aspx?productReleaseID=O365HomePremRetail&platform=X86&language=en-US&version=O15GA&source=O15OLSOMEX"  # استبدل برابط صحيح لأداة التثبيت
$installerPath = "C:\Temp\OfficeSetup.exe"

# ==== إنشاء المجلد المؤقت ====
New-Item -ItemType Directory -Path "C:\Temp" -Force

# ==== تحميل أداة تثبيت Office ====
Write-Host "Downloading Office Installer..." -ForegroundColor Yellow
try {
    Invoke-WebRequest -Uri $officeSetupUrl -OutFile $installerPath
} catch {
    Write-Host "Error downloading Office Installer: $_" -ForegroundColor Red
    exit
}

# ==== التحقق من وجود الملف ====
if (!(Test-Path $installerPath)) {
    Write-Host "Office Installer not found at $installerPath" -ForegroundColor Red
    exit
}

# ==== تشغيل المثبت ====
Write-Host "Running Office Installer..." -ForegroundColor Yellow
try {
    Start-Process -FilePath $installerPath -Wait
} catch {
    Write-Host "Error running Office Installer: $_" -ForegroundColor Red
    exit
}

start cmd.exe

# فتح ستور 
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore" -Name "RemoveWindowsStore" -Value 0
gpupdate /force
# تعطييل ستور
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore" -Name "RemoveWindowsStore" -Value 1
gpupdate /force
# يوس اس بي
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "Deny_all" -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR" -Name "Start" -Value 3
gpupdate /force
# اغلاق 
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "Deny_all" -Value 1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR" -Name "Start" -Value 4
gpupdate /force



#eployment Image Servicing and Management
DISM /Online /Add-Capability /CapabilityName:WirelessDisplay.Connect~~~~0.0.1.0

#✅ للتحقق مما إذا كانت الميزة مثبتة بالفعل:



DISM /Online /Get-Capabilities | Findstr "WirelessDisplay"

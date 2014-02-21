New-Item -type directory -path C:\Users\evxasus001\Documents\GitHub\2014-0219_C_C
$Acl = Get-Acl "C:\Users\evxasus001\Documents\GitHub\2014-0219_C_C_"
$Ar = New-Object  system.security.accesscontrol.filesystemaccessrule("evxasus001","FullControl","Allow")
$Acl.SetAccessRule($Ar)
Set-Acl "C:\Users\evxasus001\Documents\GitHub\2014-0219_C_C" $Acl

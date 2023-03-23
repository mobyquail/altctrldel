#$Currentpath = ("C:\OOHacks") 
$Currentpath = split-path -parent $MyInvocation.MyCommand.Definition
$FileLogdate = Get-Date -format 'dd.MM.yyyy HH_mm_ss'
Write-Host($FileLogdate)
New-Item -Path $Currentpath -Name "$FileLogdate" -ItemType "file" | Rename-Item -newname {"DC-Down-" + $_.name + ".txt"}
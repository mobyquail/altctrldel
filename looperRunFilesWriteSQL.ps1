<#
.TD
.SQl Writer
.
.
#>

$sqlSrv = "Max\SQLEXPRESS"
$dbName = "HacksDB"
$tbl = "numbers"
$loc = "C:\00looper\logs\"
$file =  "random.txt"
$file2 =  "random2.txt"
$locFile = ("$loc" + "$file")
$locFile2 = ("$loc" + "$file2")
$locFile3 = ("$loc" + "$logFile")
$FileLogdate = Get-Date -format 'yyyy.MM.dd HH.mm.ss'
$logFile = ("$FileLogdate" + ".txt")

Function writeSomeShit2Sql
{
param($first,$second,$third,$fourth, $fifth, $sixth)
$Query = @"
        INSERT INTO [$dbName].[dbo].[$tbl](first, second, third, fourth, fifth, sixth)
                                  VALUES ('$random1','$random2','$random3','$random4', '$random5', '$random6')
"@

Invoke-sqlcmd -ServerInstance $sqlSrv -Database $dbName  -Query $Query
}

For ($i=1; $i -le 1000; $i++)
{
$random1 = Get-Random -Maximum 9999999 -Minimum 1
$random2 = Get-Random -Maximum 9999999 -Minimum 1
$random3 = Get-Random -Maximum 9999999 -Minimum 1
$random4 = Get-Random -Maximum 9999999 -Minimum 1
$random5 = Get-Random -Maximum 9999999 -Minimum 1
$random6 = Get-Random -Maximum 9999999 -Minimum 1
ac -Path $locFile -Value "$random1, $random2, $random3, $random4, $random5, $random6"
write-host $random1, $random2, $random3, $random4, $random5, $random6
writeSomeShit2Sql $sqlServer $first $i.second $i.third $i.fourth $i.fifth $i.sixth
}

$run = (gc $locfile)
ac $locfile2 $run
Select-String -Path $locFile -Pattern "23" | ac $locFile2
Select-String -Path $locFile -Pattern "23" | Write-Host
Remove-Item -path $locFile
Rename-Item -path $locFile2 -newname $logFile 
#$xxx = Get-Content $locFile3
#write-host $xxx

break  

<#SQL to create the needed DB and table

CREATE DATABASE HacksDB;

###

CREATE TABLE maxSvcs
(
[first] varchar (255) not null,
[second] varchar (255) not null,
[third] varchar (255) not null,
[fourth] varchar (255),
[fifth] varchar (255),
[sixth] varchar (255),
[TimeStamp] [datetime] NOT NULL DEFAULT (GetDate()),
)

###
#.run a SQL query thru PS
Invoke-sqlcmd -ServerInstance "Max\SQLEXPRESS" -Database "HacksDB" -InputFile "C:\00SQL\sd\tosca.sql" | format-table -AutoSize


select * from dbo.numbers where first < '5000'

DELETE FROM numbers
WHERE first = 'first'

DELETE TOP (200) FROM HacksDB.dbo.numbers;  



#>

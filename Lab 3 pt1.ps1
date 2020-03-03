<#

Purpose: 3rd Powershell Lab. Practices use of:
    Here Strings
    Piping Commands
    Writing and Reading files
    Conditional Logic
Author: Robert Nohr
File: Lab 3 pt1.ps1
Date: Feburary 24, 2020
#>

cls
cd $env:USERPROFILE
Get-ChildItem -Filter *.txt | Format-Table -Property Name, Length

$list = @"
Pizza choices:
    1. Write a contact entry to a file
    2. Display all files last written to after a given date
    3. Read a specified text file


"@
$list
$choice = Read-Host "Enter the number of your choice"
if ($choice -eq 1) {
    $name = Read-Host "Enter Full Name"
    $phone = Read-Host "Enter Phone Number"
    $email = Read-Host "Enter Email Address"
    $file = Read-Host "Make A File Name to add this info into"
    Add-Content -Path C:\Users\nohrob\Logs\"$file".txt -Value $name, $phone, $email, ""
}
elseif ($choice -eq 2) {
    $early = Read-Host "Earliest date of files to display (Make Sure Spelling is correct)" 
    Get-ChildItem -Recurse | Where-Object{$_.LastWriteTime -GE "$early"} | Format-Table -Property Name, LastWriteTime
}
elseif ($choice -eq 3) {
    CD C:\Users\nohrob\
    $host3 = Read-Host "What's the name of the file you request to read from your profile?"
    $ans = Test-Path -Path C:\Users\nohrob\"$host3"
    if ($ans -eq "True") {
        Write-Output "File exists, here is what's in it"
        Write-Output "-------------------------------------"
        Get-Content C:\Users\nohrob\"$host3"
    }
    else {
        Write-Output "File does not exist"
    }
}
else {
    Write-Output "The Choice you made is an inapporiate Response"
    Write-Output "You're running this computer on $env:COMPUTERNAME"
    Write-Output "You're logged on as $env:USERNAME"
}
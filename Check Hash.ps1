
## Check Hash aginst file script ##

# set below  if needed.
# Set-ExecutionPolicy RemoteSigned


# For future menu system
<# Algorithm Types
$algorithm = @(
"SHA1";
"SHA256";
"SHA384";
"SHA512";
"MACTripleDES";
"MD5";
"RIPEMD160";
)
#>


# Hash to compare
$HashCheck = Read-Host -Prompt 'Please Paste Hash to Compare'


Echo " Select file to check "
# Prompt for File location 
[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null   
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.initialDirectory = $initialDirectory
$OpenFileDialog.ShowDialog() | Out-Null
$Filename = $OpenFileDialog.FileName


$Hash = Get-FileHash $Filename -Algorithm SHA1 | select hash


#Compare Hashes
if ($hash.Hash -eq $HashCheck) 
{
        write-host "Hashes match " -ForegroundColor yellow 
} 
else 
{
        write-host ""$hash.hash" does not match $HashCheck " -ForegroundColor red 
}

        
Read-Host -Prompt "Press Enter to exit"
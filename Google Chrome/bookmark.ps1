param (
    [Parameter(Mandatory=$true)]
    [string]$source_computer,

    [Parameter(Mandatory=$true)]
    [string]$receive_computer,

    [Parameter(Mandatory=$true)]
    [string]$source_user

)

# Define the source and destination file paths
$sourceFilePath = "\\$source_computer\C$\Users\$source_user\AppData\Local\Google\Chrome\User Data\Default\Bookmarks"
$destinationFilePath = "\\$receive_computer\C$\Users\$source_user\AppData\Local\Google\Chrome\User Data\Default"

# Use the Copy-Item cmdlet to copy the file
Copy-Item -Path $sourceFilePath -Destination $destinationFilePath -Force


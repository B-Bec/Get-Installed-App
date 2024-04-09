param (
    [Parameter(Mandatory=$true)]
    [string]$source_computer,

    [Parameter(Mandatory=$true)]
    [string]$receive_computer,

    [Parameter(Mandatory=$true)]
    [string]$source_user,

    [Parameter(Mandatory=$true)]
    [string]$receive_user

)

# Define the source and destination file paths for signatures
$sourceFilePath = "\\$source_computer\C$\Users\$source_user\AppData\Roaming\Microsoft\Signatures"
$destinationFilePath = "\\$receive_computer\C$\Users\$receive_user\AppData\Roaming\Microsoft"


# Use the Copy-Item cmdlet to copy the Signatures Folder
Copy-Item -Path $sourceFilePath -Destination $destinationFilePath -Force -Recurse

# Check if the source path exists
if (Test-Path -Path $sourceFilePath) {
    # Copy the folder to the destination path
    Copy-Item -Path $sourceFilePath -Destination $destinationFilePath -Force

    # Check if the destination path now exists (i.e., the folder was copied successfully)
    if (Test-Path -Path $destinationFilePath) {
        Write-Output "Signatures Folder copied successfully."
    } else {
        Write-Output "Failed to copy folder."
    }
} else {
    Write-Output "Source path does not exist."
}

# Ask for confirmation before copying the new file
$confirmation = Read-Host "Do you want to copy the new file? (yes/no)"
if ($confirmation -eq "yes") {
    # Define the source and destination file paths for Templates
    $sourceFilePath1 = "\\$source_computer\C$\Users\$source_user\AppData\Roaming\Microsoft\Templates"
    $destinationFilePath2 = "\\$receive_computer\C$\Users\$receive_user\AppData\Roaming\Microsoft"


        # Use the Copy-Item cmdlet to copy the Template Folder
    Copy-Item -Path $sourceFilePath1 -Destination $destinationFilePath2 -Force -Recurse

    # Check if the source path exists
    if (Test-Path -Path $sourceFilePath) {
        # Copy the folder to the destination path
        Copy-Item -Path $sourceFilePath -Destination $destinationFilePath -Force 

        # Check if the destination path now exists (i.e., the folder was copied successfully)
        if (Test-Path -Path $destinationFilePath) {
            Write-Output "Template Folder copied successfully."
        } else {
            Write-Output "Failed to copy folder."
        }
    } else {
        Write-Output "Source path does not exist."
    }
} else {
    Write-Output "Template Folder didn't transfer."
}

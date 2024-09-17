function Move-OldScreenshots {
    param (
        [string]$SourcePath = "C:\Users\username\Pictures\Screenshots",
        [string]$BackupPath = "C:\Users\username\Pictures\Screenshots_backup"
    )

    # Ensure the backup directory exists, create if it doesn't
    if (-not (Test-Path -Path $BackupPath)) {
        New-Item -ItemType Directory -Path $BackupPath | Out-Null
    }

    # Calculate the date threshold (1 week ago)
    $ThresholdDate = (Get-Date).AddDays(-7)

    # Get files and folders older than the threshold date
    $OldItems = Get-ChildItem -Path $SourcePath |
                Where-Object { $_.LastWriteTime -lt $ThresholdDate }

    # Group items by last modified date and format the date for folder structure
    $GroupedItems = $OldItems | Group-Object { 
        $date = $_.LastWriteTime
        "$($date.Year)\$($date.ToString('yyyyMM'))\$($date.ToString('yyyyMMdd'))"
    }

    # Move each group of items to the appropriate date-based folder
    foreach ($Group in $GroupedItems) {
        $DateFolderHierarchy = $Group.Name
        $DestinationFolder = Join-Path -Path $BackupPath -ChildPath $DateFolderHierarchy
        
        if (-not (Test-Path -Path $DestinationFolder)) {
            New-Item -ItemType Directory -Path $DestinationFolder | Out-Null
        }

        foreach ($Item in $Group.Group) {
            $Destination = Join-Path -Path $DestinationFolder -ChildPath $Item.Name
            Move-Item -Path $Item.FullName -Destination $Destination -Force
        }
    }
}

function Move-OldRecordings {
    param (
        [string]$SourcePath = "C:\Users\username\Videos\Captures",
        [string]$BackupPath = "C:\Users\username\Videos\Captures_backup"
    )

    # Ensure the backup directory exists, create if it doesn't
    if (-not (Test-Path -Path $BackupPath)) {
        New-Item -ItemType Directory -Path $BackupPath | Out-Null
    }

    # Calculate the date threshold (1 week ago)
    $ThresholdDate = (Get-Date).AddDays(-7)

    # Get files and folders older than the threshold date
    $OldItems = Get-ChildItem -Path $SourcePath |
                Where-Object { $_.LastWriteTime -lt $ThresholdDate }

    # Group items by last modified date and format the date for folder structure
    $GroupedItems = $OldItems | Group-Object { 
        $date = $_.LastWriteTime
        "$($date.Year)\$($date.ToString('yyyyMM'))"
    }

    # Move each group of items to the appropriate date-based folder
    foreach ($Group in $GroupedItems) {
        $DateFolderHierarchy = $Group.Name
        $DestinationFolder = Join-Path -Path $BackupPath -ChildPath $DateFolderHierarchy
        
        if (-not (Test-Path -Path $DestinationFolder)) {
            New-Item -ItemType Directory -Path $DestinationFolder | Out-Null
        }

        foreach ($Item in $Group.Group) {
            $Destination = Join-Path -Path $DestinationFolder -ChildPath $Item.Name
            Move-Item -Path $Item.FullName -Destination $Destination -Force
        }
    }
}

function Move-OldDownloads {
    param (
        [string]$SourcePath = "C:\Users\username\Downloads",
        [string]$BackupPath = "C:\Users\username\Downloads\Downloads_backup"
    )

	# Ensure the backup directory exists, create if it doesn't
    if (-not (Test-Path -Path $BackupPath)) {
        New-Item -ItemType Directory -Path $BackupPath | Out-Null
    }

    # Calculate the date threshold (1 week ago)
    $ThresholdDate = (Get-Date).AddDays(-3)

    # Get files and folders older than the threshold date, excluding specified folders
    $OldItems = Get-ChildItem -Path $SourcePath -Exclude 'Downloads_backup' |
                Where-Object { $_.LastWriteTime -lt $ThresholdDate }

    # Group items by last modified date and format the date for folder structure
    $GroupedItems = $OldItems | Group-Object { 
        $date = $_.LastWriteTime
        "$($date.Year)\$($date.ToString('yyyyMM'))"
    }

    # Move each group of items to the appropriate date-based folder
    foreach ($Group in $GroupedItems) {
        $DateFolderHierarchy = $Group.Name
        $DestinationFolder = Join-Path -Path $BackupPath -ChildPath $DateFolderHierarchy
        
        if (-not (Test-Path -Path $DestinationFolder)) {
            New-Item -ItemType Directory -Path $DestinationFolder | Out-Null
        }

        foreach ($Item in $Group.Group) {
            $Destination = Join-Path -Path $DestinationFolder -ChildPath $Item.Name
            Move-Item -Path $Item.FullName -Destination $Destination -Force
        }
    }
}

# Example usage:
Move-OldScreenshots
Move-OldRecordings
Move-OldDownloads

# Get the currently connected network profile
$network = Get-NetConnectionProfile | Where-Object { $_.InterfaceAlias -eq (Get-NetAdapter -Physical | Where-Object { $_.Status -eq 'Up' }).Name }

# Check if the current network profile is Private
if ($network.NetworkCategory -eq 'Private') {
    # Change the network profile to Public
    Set-NetConnectionProfile -InterfaceIndex $network.InterfaceIndex -NetworkCategory Public
}

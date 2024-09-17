# Function to get the currently active power plan
$powerPlan = powercfg /GETACTIVESCHEME
$powerPlanGuid = $powerPlan | Select-String -Pattern "Power Scheme GUID: (.+)  " | ForEach-Object { $_.Matches.Groups[1].Value }

# Define the target power plans
$balancedPlan = "111x1111-x111-11x1-1111-xx1xx111xx1x"
$performancePlan = "xx1x1xxx-1x11-11x1-xx11-x1111x1x1x1x"

# Check if the current power plan is Performance
if ($powerPlanGuid -eq $performancePlan) {
    # Change the power plan to Balanced
    powercfg /S $balancedPlan
}

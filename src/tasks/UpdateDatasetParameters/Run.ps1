Trace-VstsEnteringInvocation $MyInvocation

Try
{
	If (-not ($toolsPath = Get-VstsTaskVariable -Name "PowerBI_Tools_Path"))
	{
		Write-VstsTaskError -Message "Please add the 'Power BI Tool Installer' before this task."
	}
	Else
	{
		Import-Module "$toolsPath/Modules/PowerBI" -Force
	}

	# Connect
	Connect-PowerBI -Endpoint (Get-VstsEndpoint -Name (Get-VstsInput -Name Connection))

	# Execute
	$Group = Get-VstsInput -Name Workspace
	$DatasetId = Get-VstsInput -Name DatasetId
	$Parameters = Get-VstsInput -Name DatasetParameters | ConvertFrom-Json -ErrorAction SilentlyContinue

	Update-PowerBIDatasetParameters -Group $Group -Dataset $DatasetId -Parameters $Parameters
}
Finally
{
	Trace-VstsLeavingInvocation $MyInvocation
}

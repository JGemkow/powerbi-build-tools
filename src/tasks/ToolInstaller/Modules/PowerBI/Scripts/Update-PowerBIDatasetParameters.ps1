Function Update-PowerBIDatasetParameters
{
	Param
	(
	    [Parameter(Mandatory = $false)][string]$Group,
		[Parameter(Mandatory = $true)][string]$Dataset,
		[Parameter(Mandatory = $true)]$Parameters
	)

	$GroupId = Get-PowerBIGroup -Group $Group -Id
	$DatasetId = Get-PowerBIDataset -Group $GroupId -Dataset $Dataset -Id

	$Url = Get-PowerBIUrl -Group $GroupId -Url "datasets/$DatasetId/Default.UpdateParameters"
	$UpdateDetailItems = [System.Collections.ArrayList]::new()
	
	$Parameters | Get-Member -MemberType *Property | % {
		$UpdateDetailItems.Add(@{
			"name" = $_.name;
			"newValue" = $Parameters.($_.name)
		})
	} 
	$UpdateDetails = @{ "updateDetails"= $UpdateDetailItems }
	$Body = $UpdateDetails | ConvertTo-Json

	Invoke-PowerBI -Method Post -Url $Url -Body $Body
}
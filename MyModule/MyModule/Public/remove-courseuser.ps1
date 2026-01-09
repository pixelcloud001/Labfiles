function remove-courseuser {
    [CmdletBinding(SupportsShouldProcess=$true,ConfirmImpact = 'high')]
    param (
        $databasefile = "$PSScriptRoot\mylabfiles.csv"
    )
    if ($PSCmdlet.ShouldProcess([string]$RemoveUser.Name)){
        $MyUserListFile = $databasefile
        $MyUserList = Get-Content -Path $MyUserListFile | ConvertFrom-Csv
        $RemoveUser = $MyUserList | Out-ConsoleGridView -OutputMode Single
        $MyUserList = $MyUserList | Where-Object {
        -not (
            $_.Name -eq $RemoveUser.Name -and
            $_.Age -eq $RemoveUser.Age -and
            $_.Color -eq $RemoveUser.Color -and
            $_.Id -eq $RemoveUser.Id
        )
        }
      Set-Content -Value $($MyUserList | ConvertTo-Csv -notypeInformation) -Path $MyUserListFile
    }
    else{
        write-host "Did not remove user $($RemoveUser.Name)"
    }

}
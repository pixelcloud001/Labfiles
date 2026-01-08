function GetUserData {
   Get-Content -Path .\MyLabFile.csv | ConvertFrom-Csv
}

enum ColorEnum {
    red
    green
    yellow
    blue
}

function Get-CourseUser {
    [CmdletBinding()]
    param (
        [Parameter()]
        [int]$olderThan = 65
    )
    $UserName = Read-host "What user should we search for?"
    $MyUserList = GetUserData | Where-Object -Property Name -Like "*$UserName*"
    $MyUserList | Where-Object -Property Age -ge $olderThan
}

function add-courseuser {
    [CmdletBinding()]
    param (
        $databasefile = ".\MyLabFile.csv",
        [Parameter(Mandatory)]
        [String]$Name,
        [Parameter(Mandatory)]
        [int]$age,
        [Parameter(Mandatory)]
        [ColorEnum] $color,
        [int]$UserId
    )
    
    if(!$UserId){
        $UserId = Get-Random -Minimum 10 -Maximum 100000
    }
    write-host $name $age $color $UserId

    $MyCsvUser = "$Name,$Age,{0},{1}" -f $Color, $UserId

    $NewCSv = Get-Content $databasefile -Raw
    $NewCSv += $MyCsvUser
    Set-Content -Value $NewCSv -Path $databasefile
}

function remove-courseuser {
    [CmdletBinding(SupportsShouldProcess=$true,ConfirmImpact = 'high')]
    param (
        $databasefile = ".\MyLabFile.csv"
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
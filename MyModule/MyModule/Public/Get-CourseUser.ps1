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
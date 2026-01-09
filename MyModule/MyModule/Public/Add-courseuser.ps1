function add-courseuser {
    [CmdletBinding()]
    param (
        $databasefile = "$PSScriptRoot\mylabfiles.csv",
        [Parameter(Mandatory)]
        [ValidatePattern({^[A-Z][\w \-]*$}, ErrorMessage = 'Name must start with a capital letter and contain only letters, numbers, underscores, hyphens, or spaces.')]
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
    $MyNewUser = [Participant]::new($Name, $Age, $Color, $UserId)
    $MyNewUser
    $MyCsvUser = $MyNewUser.ToString()
    $MyCsvUser
    #$MyCsvUser = "$Name,$Age,{0},{1}" -f $Color, $UserId

    $NewCSv = Get-Content $databasefile -Raw
    $NewCSv += $MyCsvUser
    Set-Content -Value $NewCSv -Path $databasefile
}
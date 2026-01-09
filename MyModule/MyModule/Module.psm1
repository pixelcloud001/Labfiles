# Import all class files
Get-ChildItem -Path "$PSScriptRoot/Classes" -Filter *.ps1 -Recurse |
    ForEach-Object { . $_.FullName }

# Import all private functions
Get-ChildItem -Path "$PSScriptRoot/Private" -Filter *.ps1 -Recurse |
    ForEach-Object { . $_.FullName }

# Import all public functions
Get-ChildItem -Path "$PSScriptRoot/Public" -Filter *.ps1 -Recurse |
    ForEach-Object { . $_.FullName }
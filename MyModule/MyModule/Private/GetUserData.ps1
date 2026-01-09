function GetUserData {
    try {
        Get-Content -Path "$PSScriptRoot\mylabfiles.csv" -ErrorAction stop | ConvertFrom-Csv -ErrorAction Stop
        #Get-Service sdfdsg -ErrorAction -break
    }
    catch [System.Management.Automation.ItemNotFoundException]{
        write-error "Databasefile not found"
    }
    catch{
        "Super catch"
    }
   
}
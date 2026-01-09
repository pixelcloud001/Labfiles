function Confirm-CourseID{
    $userlist = GetUserData
    #[regex]::Match($userlist.Id , (\d))
    foreach($user in $userlist){
        if(!($user.Id -match '^\d+$')){
            write-error "User $($user.Name) dont have right format"
        }
    }
}
class Participant {
    [string] $Name
    [int] $age
    [ColorEnum] $color
    [int] $id

    Participant([string]$name,[int]$age,[ColorEnum]$color,[int]$id){
        $this.name = $name
        $this.age = $age
        $this.color = $color
        $this.id = $id
    }

     [string] ToString() {
        Return '{0},{1},{2},{3}' -f $This.Name, $This.Age, $This.Color, $This.Id
    }
}
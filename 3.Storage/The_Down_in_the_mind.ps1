# Перечисление - цвет
Enum ColorOfRobot
{
    Blue
    Green
    Red
}

# Перечисление - материал
Enum MaterialOfRobot
{
    Steel
}

# Класс
Class Robot {
    #region Свойства
    [string]$Name
    [int]$Id
    
    # Дата создания объекта (для каждого своя)
    [DateTime]$Birthday = (Get-Date)
    #region Скрытое свойство
    hidden [int]$StepCount
    #endregion
    # Статическое свойство
    # Дата создания класса (у всех экземпляров этого класса одинаковая)
    static [DateTime]$Inception = (Get-Date)
    #endregion
    # Метод, вызывающий улыбку
    Smile() {
        Write-Host ':)'
    }

    # Метод - шаг
    Go([int]$Step)  { 
        Write-Host ('-'*$Step)
        $this.StepCount += $Step 
    }

    # Метод - большой шаг
    Go([int]$Step, $StepSize) { 
        Write-Host (('-' + ' ' * $StepSize) *$Step)
        $this.StepCount += $Step 
    }

    # Перечисления: цвет и материал
    [ColorOfRobot]$Color
    # Перечисление - Read-only свойство
    static [MaterialOfRobot]$Material
    
    #region Перегрузка конструктора
    # Вызывается при указании [Robot]::new()
    Robot(){}

    # Вызывается при указании [Robot]::new(1)
    Robot([string]$Id) {
        $this.Id = $Id
    }

    # Вызывается при указании [Robot]::new(1, Verter)
    Robot([string]$Id, [string]$Name) {
        $this.Id = $Id
        $this.Name = $Name
    }
    #endregion
}
Class Terminator : Robot {
    # Свойство - количество зарядов
    [int]$ShotCount = 1000
    
    # Метод - выстрел
    Shot([int]$Shots)
    {
        Write-Host ('='*$Shots + '>')
        $this.ShotCount -= $Shots
    }
}
$T800 = [Terminator]::new()
$Clones = @()
foreach ($Id in 1..5) {
    $Clones += [Robot]::new($Id)
}      
$Question = 'Кто сегодня желает поработать? - Шаг вперёд'
if ($Question) {
    $Clones.Go(1)
}

$Walle = New-Object Robot
$Walle.Color = 'Blue'

$Eva = New-Object Robot
$Eva.Color = 'Red'

$Clones[0].Go(3, 2)
$Clones[1].Go(5)
$Clones[2].Name = 'Walle'
$Clones[2].Color = 'Red' 
$Clones[3].Name = 'Eva'  
$Clones
 # -EA (на самом деле алиас параметра –ErrorAction, просто чтобы поместиться в одну строку)
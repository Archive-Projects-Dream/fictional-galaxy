# Перечисление - цвет
Enum ColorOfRobot {
    Blue
    Green
    Red
}

# Класс
Class Robot {
    #region Свойства
    [int]$Id
    [int]$Storage
    [string]$Name
    # Перечисления: цвет
    hidden [ColorOfRobot]$Color
    #endregion

    # Метод, вызывающий улыбку
    Smile() {
        Write-Host ':)'
    }

    # Метод - шаг
    Go([int]$Step)  { 
        Write-Host ('-'*$Step)
        $this.Storage += $Step 
    }

    # Метод - большой шаг
    Go([int]$Step, $StepSize) { 
        Write-Host (('-' + ' ' * $StepSize) *$Step)
        $this.Storage += $Step 
    }
    
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

# Наследование: Класс Terminator от класса Robot
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

$Clones = @()
foreach ($Id in 1..10) {
    $Clones += [Robot]::new($Id)
}
$Clones[0].Go(3, 2)
$Clones[1].Go(5)
# Отображение результата в интегрированную консоль
$Clones
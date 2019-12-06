# Перечисление - цвет
Enum ColorOfRobot {
    Blue
    Green
    Red
}

Class Kinght {
    #region [Nova]: Свойства
    [int]$Id
    [int]$Storage
    [string]$Name
    # Перечисления: цвет
    hidden [ColorOfRobot]$Color
    #endregion
    # Метод, вызывающий улыбку
    Shrug() {
        Write-Host '¯\_(ツ)_/¯'
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
    #region [Class] Перегрузка конструктора
    # Вызывается при указании [Kinght]::new()
    Kinght(){}

    # Вызывается при указании [Kinght]::new(1)
    Kinght([int]$Id) {
        $this.Id = $Id
    }

    # Вызывается при указании [Kinght]::new(1, Verter)
    Kinght([int]$Id, [int]$Name) {
        $this.Id = $Id
        $this.Name = $Name
    }
} #endregion

# Наследование: Класс Castle от класса Kinght
Class Castle : Kinght {
    #region [Nova]: Свойства Наследуемое
    # [int]$Id
    # [int]$Storage
    # [string]$Name
    # Перечисления: цвет
    # hidden [ColorOfRobot]$Color
    #endregion
    #region [Events] Свойство - количество зарядов
    [int]$ShotCount = 1000
    # Метод - выстрел
    Shot([int]$Shots)
    {
        Write-Host ('='*$Shots + '>')
        $this.ShotCount -= $Shots
    }
} #endregion

#for ([int]$i = 0, $i -lt 10, $i++) {
#    $Clones += [Kinght]::new($Id)
#    # storage.add(new SomeObject());
#}

# Создаем пустой список / Хеш-таблицу
$Clones = @()
foreach ($Id in 1..10) {
    $Clones += [Kinght]::new($Id)
}

# Присваиваем Случайные значения значения
$Clones[0].Castle.Go(3, 2)
$Clones[1].Go(5)

# Отображение результата в интегрированную консоль
$Clones

$var = $Clones.count
$var2 = "Всего в массиве: $var" 
$var2

#region
# Сам не знаю зачем я это добавил, но берет из текстового документа случайную строку текста, и пишет её в консоль.
# $content = Get-Content C:\Users\user\Desktop\1.txt
# Get-Random -InputObject $content
#endregion
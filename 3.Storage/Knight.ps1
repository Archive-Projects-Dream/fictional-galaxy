Class KnightStorage {
    [int]$Id = 0
    [string]$Name = ''
    [string]$Storage = ''

    KnightStorage(){}
    KnightStorage([int]$Id, [string]$Name, [string]$Storage) {
        $this.Name = $Name
        $this.Id = $Id
        $this.Storage = $Storage
    }
}

Class Knight : KnightStorage {
    [int]$Quantity
    [System.Collections.ArrayList]$Array = @()

    [int]SetMax([int]$Max) {
        foreach($O in 2..$Max) {
            $this.AddStep()
        }
        return -4   
    }
    [int]AddStepUp([int]$Id, [string]$Name) { # Поверх
        if($this.Array[$Id]) {
            $Id--
            $this.AddStep()
            for([int]$O = $this.Array.count; $O -gt $Id; $O--) {
                $x = $O - 1
                # Write-Host [$O]->[$x]
                if($this.Array[$O]) {
                    $this.Array[$O].Name = $this.Array[$x].Name
                    $this.Array[$O].Storage = $this.Array[$x].Storage
                }
            }
            $this.Array[$Id].Name = $Name
            $this.Array[$Id].Storage = $null
        }
        else { return -403 }
        return -3
    }
    [int]AddStepDown([int]$Id, [string]$Name) { # Поверх
        if($this.Array[$Id]) {
            $this.AddStep()
            for([int]$O = $this.Array.count; $O -gt $Id; $O--) {
                $x = $O - 1
                Write-Host [$O]->[$x]
                if($this.Array[$O]) {
                    $this.Array[$O].Name = $this.Array[$x].Name
                    $this.Array[$O].Storage = $this.Array[$x].Storage
                }
            }
            $this.Array[$Id].Name = $Name
            $this.Array[$Id].Storage = $null
        }
        else { return -402 }
        return -2
    }
    [int]AddStepUp([string]$Name, [int]$Id) { # Замена
        if($Id){
            $this.Array[$Id].Name = $Name
        }
        else{ return -401 }
        return -1
    }
    [int]AddStep() {
        $newStepId = $this.GetNewStepNumber()
        $newStep = [KnightStorage]::new($newStepId, $null, $null)
        $this.Array.Add($newStep)
        return 0
    }
    [int]AddStep([string]$Name) {
        foreach($O in 0..$this.Array.count) {
            # Ищем уже созданную пустую ячейку
            if($this.Array[$O].Name -eq "") {
                # Присваиваем значения ячейки
                $this.Array[$O].Name = $Name
                break
            }
            # Если такой нету то создаем её
            elseif($this.Array[$O].Name -eq $null) {
                # Устанавливаем новый Id
                $newStepId = $this.GetNewStepNumber()
                # Вызываем конструктор и присваиваем значения из него к объекту внутри класса
                $newStep = [KnightStorage]::new($newStepId, $Name, $null)    #region [Sun] #endregion
                # Добавляем к текушему массиву объект содержащий: (Id, "Имя", и Груз); из конструктора.
                $this.Array.Add($newStep)   #region [Fire] #endregion   
                break
            }
        }
        # Отладочное значение
        return 1
    }
    [int]AddStep([string]$Name, [string]$Storage) {
        foreach($O in 0..$this.Array.count) {
            if($this.Array[$O].Name -eq "") {
                $this.Array[$O].Name = $Name
                $this.Array[$O].Storage = $Storage
                break
            }
            elseif($this.Array[$O].Name -eq $null) {
                $newStepId = $this.GetNewStepNumber()
                $newStep = [KnightStorage]::new($newStepId, $Name, $Storage)
                $this.Array.Add($newStep)  
                break
            }
        }
        return 2
    }
    [int]DellStep([Int]$Id) {
        $Id--
        if($this.Array[$Id]) {
            $this.Array.RemoveAt($Id)
            foreach($O in $Id..$this.Array.count) {
                if($this.Array[$O].Id) {
                    $this.Array[$O].Id -= 1
                }
            }
        }
        else { return 403 }
        return 3
    }
    [int]GenStory($StorySpeek) {
        foreach($O in 0..$this.Array.count) {
            # Write-Host [$O]
            # Write-Host $this.Array.count
            if($this.Array[$O].Name -eq "") {
                $Story = Get-Random -InputObject $StorySpeek
                $this.Array[$O].Storage = $Story
                # Write-Host -[$O]
            }
        }
        return 4
    }
    [int]GenStory([int]$Id, $StorySpeek) {
        if($Id) {
            if($this.Array[$Id].Storage -eq "") {
                $Story = Get-Random -InputObject $StorySpeek
                $this.Array[$Id].Storage = $Story
            }
        }
        else { return 405 }
        return 5
    }
    [int]SetStory($StorySpeek) {
        for($O = 0; $O -le $this.Array.count; $O++) {
            # Write-Host [$O]
            # Write-Host $this.Array.count
            if($this.Array[$O].Name -eq "" -or $this.Array[$O].Storage -eq "") {
                $Story = Get-Random -InputObject $StorySpeek
                $this.Array[$O].Storage = $Story
                # Write-Host -[$O]
            }
        }
        return 6
    }

    # Метод отвечающий за показ значения ячейка внутри класса
    [int]GetStep([int]$Id) {
        return $this.Array[$Id-1] #region [Class] #endregion   
    }
    # Метод отвечающий за порядок Id
    [int]GetNewStepNumber() {
        return $this.Quantity += 1
    }
}

# Создаем объект region [Fire] 
$Knight = [Knight]::new()
$History = Get-Content Story.txt
# Задаем через метод, сколько у нас будет в массиве объектов
$Knight.SetMax(8) #endregion
function FunctionName {
    param (
        $Max
    )
$CmdRand = Get-Random (1..$Max)
$Rand = @($Knight.AddStep(), $Knight.DellStep($CmdRand), $Knight.GenStory($CmdRand, $History), $Knight.AddStepUp(1, "Случайное число: $CmdRand"), $Knight.AddStepUp(1, "Это строка была заменена! -> $CmdRand"))
$Random = Get-Random ($Rand.count)
$Rand[$Random]
}

#Уже есть в классе #region [Main]
# $Knight.Array.count
# $Max = 10
# For([int]$i = 0; $i -lt $Max; $i++) {
#     FunctionName($Max)
# } #endregion
# Есть уже при вызове массива #region [Events]
# For([int]$i = 0; $i -lt $Knight.Array.count; $i++) {
#     $Knight.Array[$i]
# } #endregion

$Knight.AddStep('Позолеченный сундук','Горсть золотых монет')
$Knight.AddStep()
$Knight.GenStory($History)
$Knight.AddStepUp(1,'Создалось над 1ым Id')
$Knight.AddStepDown(5,'Создалось под 5ым Id')
$Knight.AddStep('Номер 2')
$Knight.AddStep('Step Two','ScriptTwo.ps1')
$Knight.AddStep('Тридцать три')

# Смотрим что ~именно~ в массиве
$Knight.Array
# $Knight.GenStory($History) ||         Генерируем случаные фразы для массива из .Txt файла ($History - Или же путь к файлу .Txt)
# $Knight.SetStory(Id, $History) ||     Генерируем случаную фразу для Id из $History - Или же путь к файлу .Txt
# $Knight.AddStepUp(Id, "Имя")          Добавить поверху Id
# $Knight.AddStepUp("Имя", Id)          Заменить Объект по Id 
# $Knight.AddStepDown(Id, "Имя")        Добавить понизу Id
# $Knight.AddStep()                     Добавить: пустое значение, дДобавить значения
# $Knight.AddStep("Имя")
# $Knight.AddStep("Имя", "Имя")         
# $Knight.DellStep(Id)                  Удалить элемент под Id
# $Knight.Array                         Показать массив

#region [Nova]
# Преход наверх
# Преход вниз
# Консоль добавить перед
# Консоль добавить после
# изменить
# Добавить внизу
#endregion

#region [Main] Пример основной программы
# int main()
# {
#     MyStorage storage(10);
#     for (int i = 0; i < storage.getCount(); i++) {
#         storage.SetObject(i, new point());
#     }
#     for (int i = 0; i < storage.getCount(); i++) {    # Поочередный выбор можно и вызвыть обращением к массиву
#         storage.GetObject(i).show_parametri();
#     }
#     system("pause");
#     return 0;
    
# } #endregion
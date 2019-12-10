Class KnightStorage {
    [int]$Id = 0
    [string]$Name = ''
    [string]$Storage = ''

    KnightStorage([int]$Id, [string]$Name, [string]$Storage) {
        $this.Name = $Name
        $this.Id = $Id
        $this.Storage = $Storage
    }
}

Class Knight {
    [int]$Quantity = 0
    [System.Collections.ArrayList]$Array = @()

    [int]AddStep() {
        $newStepId = $this.GetNewStepNumber()
        $newStep = [KnightStorage]::new($newStepId, $null, $null)
        $this.Array.Add($newStep)
        return 0
    }
    [int]AddStep([string]$Name) {
        foreach($O in 0..$this.Array.count) {
            if($this.Array[$O].Name -eq $null) {
                # Устанавливаем новый Id
                $newStepId = $this.GetNewStepNumber()
                # Вызываем конструктор и присваиваем значения из него к объекту внутри класса
                $newStep = [KnightStorage]::new($newStepId, $Name, $null)    #region [Sun] #endregion
                # Добавляем к текушему массиву объект содержащий: (Id, Имя, и Груз); из конструктора.
                $this.Array.Add($newStep)   #region [Fire] #endregion   
                break
            }
            elseif($this.Array[$O].Name -eq "") {
                $this.Array[$O].Name = $Name
                break
            }
        }
        # Отладочное значение
        return 1
    }
    [int]AddStep([string]$Name, [string]$Storage) {
        foreach($O in 0..$this.Array.count) {
            if($this.Array[$O].Name -eq $null) {
                $newStepId = $this.GetNewStepNumber()
                $newStep = [KnightStorage]::new($newStepId, $Name, $Storage)
                $this.Array.Add($newStep)  
                break
            }
            elseif($this.Array[$O].Name -eq "") {
                $this.Array[$O].Name = $Name
                $this.Array[$O].Storage = $Storage
                break
            }
        }
        return 2
    }
    # Метод отвечающий за показ значения ячейка внутри класса
    [int]GetStepName([int]$Id) {
        return $this.Array[$Id-1]
    }
    # Метод отвечающий за порядок Id
    [int]GetNewStepNumber() {
        return $this.Quantity += 1
    }
}

# Создаем объект
$Knight = [Knight]::new()
# Определяем через метод, что у нас будет в ячейках объекта
$Knight.AddStep('Позолеченный сундук','Горсть золотых монет')
$Knight.AddStep()
$Knight.AddStep('Номер 2')
$Knight.AddStep('Step Two','ScriptTwo.ps1')
$Knight.AddStep('Тридцать три')

# Смотрим что ~именно~ в массиве
$Knight.Array
# Проверка работы
# $Knight.Array[1]
# $k = '[' + 1 + ']' + ': ""'
# $k
# $Knight.Array[1].name -eq ""
# $k = '[' + 2 + ']' + ': ""'
# $k
# $Knight.Array[2].name -eq ""
# $k = '[' + 6 + ']' + ': ""'
# $k
# $Knight.Array[6].name -eq ""
# $k = '[' + 1 + ']' + ': $null'
# $k
# $Knight.Array[1].name -eq $null
# $k = '[' + 2 + ']' + ': $null'
# $k
# $Knight.Array[2].name -eq $null
# $k = '[' + 6 + ']' + ': $null'
# $k
# $Knight.Array[6].name -eq $null

#region [Events]
Function Main()
{
    
} #endregion
#region [Main]
# int main()
# {
#     MyStorage storage(10);
#     for (int i = 0; i < storage.getCount(); i++) {
#         storage.SetObject(i, new point());
#     }
#     for (int i = 0; i < storage.getCount(); i++) {
#         storage.GetObject(i).show_parametri();
#     }
#     system("pause");
#     return 0;
    
# } #endregion
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

    [int]AddStep([string]$Name, [string]$Storage) {
        foreach($O in 0..$this.Quantity) {
            if($this.Array[$O].storage -eq $null) {
                # Устанавливаем новый Id
                $newStepId = $this.GetNewStepNumber()
                # Вызываем конструктор и присваиваем значения из него к объекту внутри класса
                $newStep = [KnightStorage]::new($newStepId, $Name, $Storage)    #region [Sun] #endregion
                # Добавляем к текушему массиву объект содержащий: (Id, Имя, и Груз); из конструктора.
                $this.Array.Add($newStep)   #region [Fire] #endregion   
                break
            }
        }
        # Отладочное значение
        return 555
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
$Knight.AddStep('Step Two','ScriptTwo.ps1')

# Смотрим что ~именно~ в массиве
$Knight.Array
# $Knight.Array[1]
$y = @()

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
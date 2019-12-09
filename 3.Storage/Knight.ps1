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
        $newStepId = $this.GetNewStepNumber()
        $newStep = [KnightStorage]::new($newStepId, $Name, $Storage)    #region [Sun] #endregion

        # Добавляем к текушему массиву: Id, Имя, и Груз
        $this.Array.Add($newStep)   #region [Fire] #endregion

        return $newStepId
    }
    # Метод отвечающий за что то...
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
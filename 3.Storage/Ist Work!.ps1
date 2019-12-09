Class Step2 {
    [int]$Id = 0
    [string]$Name = ''
    [string]$Storage = ''

    Step2([int]$Id, [string]$Name, [string]$Storage) {
        $this.Name = $Name
        $this.Id = $Id
        $this.Storage = $Storage
    }
}

Class Guide {
    [int]$Quantity = 0
    [System.Collections.ArrayList]$Array = @()

    [int]AddStep([string]$Name, [string]$Storage) {
        $newStepId = $this.GetNewStepNumber()
        $newStep = [Step2]::new($newStepId, $Name, $Storage)

        # Добавляем к текушему массиву: Id, Имя, и Груз
        $this.Array.Add($newStep)

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

$Guide = [Guide]::new()

$Guide.AddStep('Шаг Первый','Храним что то тут')
$Guide.AddStep('Step Two','ScriptTwo.ps1')

$Guide.Array
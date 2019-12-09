# Перечисление - цвет
Enum ColorOfRobot {
    Blue
    Green
    Red
}

Class Kinght {
    #region [Nova]: Свойства
    [int]$Id
    [string]$Storage
    # [string]$Name
    # Перечисления: цвет
    hidden [ColorOfRobot]$Color
    #endregion
    # Метод, вызывающий улыбку
    Go() {
        $this.Storage = '¯\_(ツ)_/¯'
    }
    Go([string]$Step) {
        $this.Storage = $Step
    }
    # Метод - шаг
    Go([int]$Step)  { 
        # Write-Host ('-'*$Step)
        $this.Storage += $Step 
    }

    # Метод - большой шаг
    Go([int]$Step, $StepSize) { 
        # Write-Host (('-' + ' ' * $StepSize) *$Step)
        $this.Storage += $Step 
    }
    #region [Class] Перегрузка конструктора
    # Вызывается при указании [Kinght]::new()
    Kinght(){}

    # Вызывается при указании [Kinght]::new(1)
    Kinght([int]$Id) {
        $this.Id = $Id
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
    # [void] описание методов начинается с указания типа возвращаемого значения, в том случае если метод не возвращает ничего следует указать ключевое слово [void];
    {
        Write-Host ('='*$Shots + '>')
        $this.ShotCount -= $Shots
    }
} #endregion

#for ([int]$i = 0, $i -lt 10, $i++) {
#    $Clones += [Kinght]::new($Id)
#    # storage.add(new SomeObject());
#}

# Отображение результата в интегрированную консоль
$Clones
$var = $Clones.count
$var2 = "Всего в массиве: $var" 
$var2
@'
Class MyStorage2 {
    private:
        shape **objects;
        int size;
    public:
    # Конструктор
        MyStorage(int size) {
            this->size = size;
            objects = new shape*[size];
        }
    # Метод?
        void SetObject(int index, shape *object) {
            objects[index] = object;
        }
    # Перегруженный Метод???
        shape GetObject(int index) {
            return *objects[index];
        }
}
'@
Class MyStorage {
    MyStorage([int]$size) {
        $this.size = $size;
        Write-Host ('=' + $size + '=')
        $objects = new shape*$size  #
    }
    SetObject([int]$index, shape *object) { #
        $objects[index] = $object;
    }
    shape"&" GetObject(int index) { #
        return *objects[index]; #
    }
}

#Main-function
function main {
    # Создаем пустой список / Хеш-таблицу
    [Array]$Clones = @()
    $MaxClones = 10
    foreach ($O in 1..$MaxClones) {
        $Clones += [Kinght]::new($O)
    }
    MyStorage storage(10);

    # Присваиваем Случайные значения значения
    $content = Get-Content C:\Users\user\Desktop\1.txt
    $MaxClones--
    $Max = 18
    foreach ($O in 0..$Max) {
        if($O -le $MaxClones){
            # $y = Get-Random  (0..10)
            $content1 = Get-Random -InputObject $content
            $Clones[$O].Go($content1)
        }
        else {
            $Ox = 1 + $O
            $Clones += [Kinght]::new($Ox)
            $content1 = Get-Random -InputObject $content
            $Clones[$O].Go($content1)
        }
    }

    #starting helper function
    helper-func
}

#Helpers
function helper-func {
    Write-host "foo"
}

#Entry point
main

#region Может быть и пригодиться (Наработки)
#Class Load {
#    Load($folder){
#        $files = Get-ChildItem $folder 
#        foreach ($file in $files) { 
#            if ($file.length –gt 100MB) {
#            }
#        }
#    }
#} #endregion

#region
#Class Load2 {
#    Load2(){
#        # Сам не знаю зачем я это добавил, но берет из текстового документа случайную строку текста, и пишет её в консоль.
#        $content = Get-Content C:\Users\user\Desktop\1.txt
#        Get-Random -InputObject $content
#    }
#} #endregion

#region Метод замены
#Class Save : Kinght {
#    #region [Nova]: Свойства Наследуемое
#    # [int]$Id
#    # [int]$Storage
#    #endregion
#    Load() {
#    foreach ($Id in 1..10){
#        if($Id -eq ""){
#            sd
#        }
#    }
#}
#}
#endregion

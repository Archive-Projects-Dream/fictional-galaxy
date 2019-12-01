# Подключаем то, с помощью чего будем рисовать нашу форму, если хотить запускать
Add-Type -AssemblyName System.Windows.Forms

# Главное окно, по хорошему тоже стоило бы оформить в виде функции
    $SecondMain                 = New-Object System.Windows.Forms.Form
    $ToolTip                    = New-Object System.Windows.Forms.ToolTip
    
    # Размер контролеров и форм, что бы избежать растягивания формы
    $System_Drawing_Size       = New-Object System.Drawing.Size 

     # Вскплывающее окно с подсказками
     $ToolTip.BackColor = [System.Drawing.Color]::LightGoldenrodYellow
     $ToolTip.IsBalloon = $true

     # Инициализация контролеров форм
    $LabelSwitch                = New-Object System.Windows.Forms.Label

# Описываем свойства:
# Главная форма
$SecondMain.Text = 'Об Авторе'
$SecondMain.DataBindings.DefaultDataSourceUpdateMode = 0 
$SecondMain.ClientSize = $System_Drawing_Size 
$SecondMain.DataBindings.DefaultDataSourceUpdateMode = 0 
$System_Drawing_Size.Height = 80
$System_Drawing_Size.Width = 200
$SecondMain.MaximumSize = $System_Drawing_Size 
$SecondMain.MinimumSize = $System_Drawing_Size
$SecondMain.Icon = New-Object System.Drawing.Icon("D:\The interesting\resource\about.ico")
$SecondMain.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog

$LabelSwitch.Location = new-object System.Drawing.Size(10,10)
$LabelSwitch.Text = "Автор: Сергей Гундарь."
$LabelSwitch.Autosize = 1

# Добавляем контролы в форму и вызываем её запуск
$SecondMain.Controls.Add($LabelSwitch)

$SecondMain.ShowDialog()| Out-Null
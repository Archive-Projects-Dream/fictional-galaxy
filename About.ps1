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
    $LabelAbout                = New-Object System.Windows.Forms.Label
    $label1                    = New-Object System.Windows.Forms.Label

# Описываем свойства:
# Главная форма
$SecondMain.Text = 'Об Авторе'
$SecondMain.ClientSize = $System_Drawing_Size 
$SecondMain.DataBindings.DefaultDataSourceUpdateMode = 0 
$System_Drawing_Size.Height = 120
$System_Drawing_Size.Width = 200
$SecondMain.Autosize = 1
$SecondMain.Icon = New-Object System.Drawing.Icon("D:\The interesting\resource\about.ico")
$SecondMain.FormBorderStyle = "FixedDialog"

$LabelAbout.Location = new-object System.Drawing.Size(10,10)
$LabelAbout.Text = "Автор: Сергей Гундарь."
$LabelAbout.Autosize = 1

$Label1.Location = new-object System.Drawing.Size(10,25)
$label1.DataBindings.DefaultDataSourceUpdateMode = 0 
$label1.Font = New-Object System.Drawing.Font("Calibri", 12, 1, 3, 0)
$label1.Height = 23 
$label1.Width = 183 
$label1.TabIndex = 1
$label1.Text = "Сделано на PowerShell" 

# Добавляем контролы в форму и вызываем её запуск
$SecondMain.Controls.Add($LabelAbout)
$SecondMain.Controls.Add($label1)

$SecondMain.ShowDialog()| Out-Null
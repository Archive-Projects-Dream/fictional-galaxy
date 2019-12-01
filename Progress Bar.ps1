# Подключаем то, с помощью чего будем рисовать нашу форму, если хотить запускать
Add-Type -AssemblyName System.Windows.Forms

# Главное окно, по хорошему тоже стоило бы оформить в виде функции
$SecondMain                 = New-Object System.Windows.Forms.Form
$ProgressBar                = New-Object System.Windows.Forms.ProgressBar

# Окошко с подсказками
$ToolTip.BackColor = [System.Drawing.Color]::LightGoldenrodYellow
$ToolTip.IsBalloon = $true

# Инициализация контролов формы
# Чекбокс
$CheckBoxTimer              = New-Object System.Windows.Forms.CheckBox

# Добавляем верхнее меню в формы
$Menu                       = New-Object System.Windows.Forms.MainMenu
$menuItem1                  = New-Object System.Windows.Forms.menuItem

# Описываем свойства:
# Главная форма
$SecondMain.Text = 'ProgressBar'
$SecondMain.DataBindings.DefaultDataSourceUpdateMode = 0 
$SecondMain.Height = 100 
$SecondMain.Width = 260 
$SecondMain.AutoSize = 1
$SecondMain.Icon = New-Object System.Drawing.Icon("D:\C\resource\dual.ico")
$SecondMain.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog

$ProgressBar.Location = new-object System.Drawing.Size(10,10)
$ProgressBar.DataBindings.DefaultDataSourceUpdateMode = 0
$ProgressBar.Step = 1
$ProgressBar.TabIndex = 1
$ProgressBar.Value = 50
$ProgressBar.Name = 'ProgressBar'

$HScrollBar.Location = New-Object System.Drawing.Point(10,40)
$HScrollBar.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @(100,18))
$HScrollBar.TabIndex = 0
$HScrollBar.Value = 50
$HScrollBar.Name = 'HScrollBar'

# Прописываем блокировочный чекбокс
$CheckBoxTimer.Location      = New-Object System.Drawing.Point(120,10)
$CheckBoxTimer.Text          = "Включить Прогресс-бар"
$CheckBoxTimer.AutoSize      = 1
$CheckBoxTimer.TabIndex      = 6
$ToolTip.SetToolTip($CheckBoxTimer, "Сними меня, а то работать не будет, наверное...")

$timer = New-Object System.Windows.Forms.Timer 
$timer.Interval = 70

$timer.add_Tick({TimerCheck})
$timer.Enabled = $false
$timer.Start()
Function TimerCheck {
if($HScrollBar.Value -ne $ProgressBar.Value){$ProgressBar.Value = $HScrollBar.Value}
}

# Добавляем контролы в форму и вызываем её запуск
$SecondMain.Controls.Add($HScrollBar)
$SecondMain.Controls.Add($ProgressBar)
$SecondMain.Controls.Add($CheckBoxTimer)
$SecondMain.ShowDialog()| Out-Null
# Подключаем то, с помощью чего будем рисовать нашу форму, если хотить запускать
Add-Type -AssemblyName System.Windows.Forms

# Повелось, что все функции описываются до их использования.
Function TimerCheck {
    if($HScrollBar.Value -ne $ProgressBar.Value){$ProgressBar.Value = $HScrollBar.Value}
    }

# Функция переключателя таймера
Function TimerSwitch {
    if($CheckBoxTimer.Checked = 1) {
        $CheckBoxTimer.Checked = 0
        $Timer.Enabled = $false
        $ProgressBar.Value = 0
    }
    else {
        $CheckBoxTimer.Checked = 1
        $Timer.Enabled = $true
    }
}

# Главное окно, по хорошему тоже стоило бы оформить в виде функции
$SecondMain                 = New-Object System.Windows.Forms.Form
$ProgressBar                = New-Object System.Windows.Forms.ProgressBar
$HScrollBar                 = New-Object System.Windows.Forms.HScrollBar

# Окошко с подсказками
$ToolTip.BackColor = [System.Drawing.Color]::LightGoldenrodYellow
$ToolTip.IsBalloon = $true

# Инициализация контролов формы
# Чекбокс и таймер
$CheckBoxTimer              = New-Object System.Windows.Forms.CheckBox
$Timer                      = New-Object System.Windows.Forms.Timer 

# Добавляем верхнее меню в формы (Оставил тут на случай если захочу добавить верхнюю панель)
# $Menu                       = New-Object System.Windows.Forms.MainMenu
# $menuItem1                  = New-Object System.Windows.Forms.menuItem

# Описываем свойства:
# Главная форма
$SecondMain.Text = 'ProgressBar'
$SecondMain.DataBindings.DefaultDataSourceUpdateMode = 0 
$SecondMain.Height = 100 
$SecondMain.Width = 260 
$SecondMain.AutoSize = 1
$SecondMain.Icon = New-Object System.Drawing.Icon("D:\C\resource\dual.ico")
$SecondMain.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog

# Прописываем индикатор прогресса
$ProgressBar.Location = new-object System.Drawing.Size(10,10)
$ProgressBar.DataBindings.DefaultDataSourceUpdateMode = 0
$ProgressBar.Step = 1
$ProgressBar.TabIndex = 1
$ProgressBar.Name = 'ProgressBar'

# Прописываем полосу прокрутки
$HScrollBar.Location = New-Object System.Drawing.Point(10,40)
$HScrollBar.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @(100,18))
$HScrollBar.TabIndex = 0
$HScrollBar.Value = 50
$HScrollBar.Name = 'HScrollBar'

# Прописываем таймер
$Timer.Interval = 70
$Timer.add_Tick({TimerCheck})
$Timer.Enabled = $false
$Timer.Add_click({TimerSwitch})
$Timer.Start()

# Прописываем блокировочный чекбокс
$CheckBoxTimer.Location      = New-Object System.Drawing.Point(120,10)
$CheckBoxTimer.Text          = "Включить индикатор прогресса"
$CheckBoxTimer.AutoSize      = 1
$CheckBoxTimer.TabIndex      = 6
$ToolTip.SetToolTip($CheckBoxTimer, "Сними меня, а то работать не будет, наверное...")

# Добавляем контролы в форму и вызываем её запуск
$SecondMain.Controls.Add($HScrollBar)
$SecondMain.Controls.Add($ProgressBar)
$SecondMain.Controls.Add($CheckBoxTimer)

$SecondMain.ShowDialog()| Out-Null
# Подключаем то, с помощью чего будем рисовать нашу форму, если хотить запускать
Add-Type -AssemblyName System.Windows.Forms

# Повелось, что все функции описываются до их использования.
Function TimerCheck {
    if($HScrollBar.Value -ne $ProgressBar.Value){$ProgressBar.Value = $HScrollBar.Value}
    }

# Функция переключателя таймера
Function TimerSwitch {
    if ($Timer.Enabled -eq $false ) {
        $LabelSwitch.Text = "Синхронизация: Активна!"
        $LabelSwitch.ForeColor = 'Green'
        $Timer.Enabled = $true
        $Timer.Start()
        $TimerStop.Start()
    }
    else {
        TargetStop
    }
}
# Функция остановки отслживания
Function TargetStop {
    $LabelSwitch.Text = "Синхронизация: Отключена!"
    $LabelSwitch.ForeColor = 'Red'
    $Timer.Enabled = $false 
    $TimerStop.Enabled = $false
    $Timer.Stop()
    $TimerStop.Stop()
    $ProgressBar.Value = 0
}

# Главное окно, по хорошему тоже стоило бы оформить в виде функции
    $SecondMain                 = New-Object System.Windows.Forms.Form
    $ToolTip                    = New-Object System.Windows.Forms.ToolTip
    
    # Размер контролеров и форм, что бы избежать растягивания формы
    $System_Drawing_Size       = New-Object System.Drawing.Size 

     # Вскплывающее окно с подсказками
     $ToolTip.BackColor = [System.Drawing.Color]::LightGoldenrodYellow
     $ToolTip.IsBalloon = $true

     # Инициализация контролеров форм
     # Индикатор прогресса, и прокрутки
    $ProgressBar                = New-Object System.Windows.Forms.ProgressBar
    $HScrollBar                 = New-Object System.Windows.Forms.HScrollBar

     # Кнопка и подпись
    $ButtonSwitch               = New-Object System.Windows.Forms.Button
    $LabelSwitch                = New-Object System.Windows.Forms.Label
     # Таймер
    $Timer                      = New-Object System.Windows.Forms.Timer 
    $TimerStop                  = New-Object System.Windows.Forms.Timer 

# Добавляем верхнее меню в формы (Оставил тут на случай если захочу добавить верхнюю панель)
# $Menu                       = New-Object System.Windows.Forms.MainMenu
# $menuItem1                  = New-Object System.Windows.Forms.menuItem

# Описываем свойства:
# Главная форма
$SecondMain.Text = 'ProgressBar'
$SecondMain.ClientSize = $System_Drawing_Size 
$SecondMain.DataBindings.DefaultDataSourceUpdateMode = 0 
$System_Drawing_Size.Height = 120
$System_Drawing_Size.Width = 260
$SecondMain.MaximumSize = $System_Drawing_Size 
$SecondMain.MinimumSize = $System_Drawing_Size
$SecondMain.Icon = New-Object System.Drawing.Icon("D:\The interesting\resource\dual.ico")
$SecondMain.FormBorderStyle = "FixedDialog"

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
$TimerStop.Interval = 5000
$TimerStop.add_Tick({TargetStop})

# Button
$ButtonSwitch.Location = new-object System.Drawing.Size(120,10)
$ButtonSwitch.Size = new-object System.Drawing.Size(100,30)
$ButtonSwitch.Text = "Активировать"
$ButtonSwitch.Add_Click({TimerSwitch})
$ToolTip.SetToolTip($ButtonSwitch, "Позволяет переключить состояние синхронизации индикатор прогресса")

$LabelSwitch.Location = new-object System.Drawing.Size(10,65)
$LabelSwitch.Text = "Синхронизация: Деактивирована."
$LabelSwitch.Autosize = 1

# Добавляем контролы в форму и вызываем её запуск
$SecondMain.Controls.Add($HScrollBar)
$SecondMain.Controls.Add($ProgressBar)
$SecondMain.Controls.Add($ButtonSwitch)
$SecondMain.Controls.Add($LabelSwitch)

$SecondMain.ShowDialog()| Out-Null
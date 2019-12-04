# Подключаем то, с помощью чего будем рисовать нашу форму
Add-Type -assembly System.Windows.Forms

	# Все просто, массивы из списка серверов, списка пользоватей, и варианты подписи - чтобы использовать могла не только поддержка.
	$Server        = @("*", "Локальная Сеть")
	$User          = @("Сергей", "UserPC", "TeppaH")
    $Message       = "Шаблон заголовка:"
	$Sign          = "Сообщение по Умолчанию"
	# По хорошему, надо бы сделать так, чтобы если сообщение по умолчанию не менялось и шло нажатие на кнопку отправить, то выводилось бы предупреждение.
	# Так же по аналогии с тем что есть, тут тоже можно бы повесить список со стандартными сообщениями.

	# Повелось так, что все функции описываются до их использования.
# Функция отправки сообщения. Принимаем параметры, проверяем, если чекбокс включен (а он включен по умолчанию), устанавливаем параметры отправки только на консоль Локального хостига, иначе проходим по списку серверов, внутри каждого сервера инициируем цикл по списку пользователей с предварительно отрезанными пробелами до и после текста(помните формат: "сервер1, сервер2, сервер3" для красивой читаемости текста), вызываем сам msg для отправки сообщения и после чего вызываем диалогов окно с подтверждением отправки и закрытием программы.
Function SendMessage {
        param ($Server, $User, $Message, $Sign)
        # Write-Host $Server, $User, $Message, $Sign
        IF ($Server -eq "Локальная Сеть"){
           $Server = "localhost"
            If ($TestRunCheckBox.Checked -eq 1 ) { Write-Host $TestRunCheckBox.Checked; $User = "Console" }
            ForEach ($Item in $Server) {
                ForEach ($UserX in $User) {
                    $UserTrim = $UserX.Trim()
                    $ServerTrim = $Item.Trim()
                    $MsgTrim = $Message.Trim()
                    $SignTrim = $SignX.Trim()
                    # Отладочный вывод, оставлен на всякий случай.
                    # Write-Host "User: $UserTrim; Server: $ServerTrim; Message: $MsgTrim; Signature: $SignTrim"
                    c:\windows\system32\msg.exe $UserTrim /Server:$ServerTrim $MsgTrim $SignTrim
                }
            }
        }
     Confirm
    }

# Вывод окна с подтверждением
Function Confirm {
        $ConfirmWin = New-Object System.Windows.Forms.Form
        $ConfirmWin.StartPosition  = "CenterScreen"
        $ConfirmWin.Text = "Подтверждение отправки"
        $ConfirmWin.ClientSize = $System_Drawing_Size 
        $ConfirmWin.DataBindings.DefaultDataSourceUpdateMode = 0 
        $System_Drawing_Size.Height = 120
        $System_Drawing_Size.Width = 210 
        $ConfirmWin.MaximumSize = $System_Drawing_Size 
        $ConfirmWin.MinimumSize = $System_Drawing_Size
        $ConfirmWin.Icon = New-Object System.Drawing.Icon("D:\The interesting\resource\warning.ico")

        $ConfirmWinOKButton = New-Object System.Windows.Forms.Button
        $ConfirmWinOKButton.Location = New-Object System.Drawing.Point(60,45)
        $ConfirmWinOKButton.Text = "Закрыть"
        $ConfirmWinOKButton.add_click({$MainSendWindow.Close(); $ConfirmWin.Close()})
        $ConfirmWinOKButton.AutoSize = 1
        
        $ConfirmLabel = New-Object System.Windows.Forms.Label
        $ConfirmLabel.Location  = New-Object System.Drawing.Point(10,10)
        IF ($Server -ne "localhost"){$ConfirmLabel.Text = "Сообщение не удалось отправить"}
        Else {$ConfirmLabel.Text = "Сообщение было отправлено"}
        $ConfirmLabel.AutoSize = 1

        $ConfirmWin.ShowInTaskbar = $false
        $ConfirmWin.Controls.Add($ConfirmLabel)
        $ConfirmWin.Controls.Add($ConfirmWinOKButton)
        $ConfirmWin.ShowDialog() | Out-Null
    }

# Главное окно, по хорошему тоже стоило бы оформить в виде функции
     $MainSendWindow            = New-Object System.Windows.Forms.Form
     $ToolTip                   = New-Object System.Windows.Forms.ToolTip

     # Размер контролеров и форм, что бы избежать растягивания формы
     $System_Drawing_Size       = New-Object System.Drawing.Size 
     
     # Вскплывающее окно с подсказками
     $ToolTip.BackColor = [System.Drawing.Color]::LightGoldenrodYellow
     $ToolTip.IsBalloon = $true
     # В дополнение к подсказкам, если нужно будет настроить
     # $ToolTip.InitialDelay = 500
     # $ToolTip.ReshowDelay = 500

     # Инициализация контролов формы
     # Кнопки и чекбокс
     $SendButton                = New-Object System.Windows.Forms.Button
     $CloseButton               = New-Object System.Windows.Forms.Button
     $TestRunCheckBox           = New-Object System.Windows.Forms.CheckBox

     # Текстовые поля и списки
     $ServerTextBox             = New-Object System.Windows.Forms.ComboBox
     $UserTextBox               = New-Object System.Windows.Forms.ComboBox
     $MessageTextBox            = New-Object System.Windows.Forms.TextBox
     $SignTextBox               = New-Object System.Windows.Forms.TextBox

     # Подписи
     $ServerTextBoxLabel        = New-Object System.Windows.Forms.Label
     $UserTextBoxLabel          = New-Object System.Windows.Forms.Label
     $MessageTextBoxLabel       = New-Object System.Windows.Forms.Label
     $SignTextBoxLabel          = New-Object System.Windows.Forms.Label

     # Добавляем верхнее меню в формы
     $Menu                      = New-Object System.Windows.Forms.MainMenu
     $menuItem1                 = New-Object System.Windows.Forms.menuItem
     $menuItem2                 = New-Object System.Windows.Forms.menuItem
     $menuItem3                 = New-Object System.Windows.Forms.menuItem
     $menuItem4                 = New-Object System.Windows.Forms.menuItem
     $menuItem5                 = New-Object System.Windows.Forms.menuItem

# Описываем свойства (комментариями я еще добавлю несколько нагугленных
# интересных свойств для общего развития и чтобы далеко не бегать ;))

# Главная форма
$MainSendWindow.StartPosition  = "CenterScreen"
$MainSendWindow.Text           = "Отправка сообщения пользователям"
$MainSendWindow.ClientSize = $System_Drawing_Size 
$MainSendWindow.DataBindings.DefaultDataSourceUpdateMode = 0 
$System_Drawing_Size.Height = 240
$System_Drawing_Size.Width = 480 
$MainSendWindow.MaximumSize = $System_Drawing_Size 
$MainSendWindow.MinimumSize = $System_Drawing_Size
$MainSendWindow.AutoSize = 1
$MainSendWindow.Icon = New-Object System.Drawing.Icon("D:\The interesting\resource\code.ico")
$MainSendWindow.FormBorderStyle = "FixedDialog"

# Подписи к текстовым полям
$ServerTextBoxLabel.Location   = New-Object System.Drawing.Point(10,12)
$ServerTextBoxLabel.Text       = "Список сетей"
$ServerTextBoxLabel.Autosize   = 1

$UserTextBoxLabel.Location     = New-Object System.Drawing.Point(10,42)
$UserTextBoxLabel.Text         = "От кого сообщение"
$UserTextBoxLabel.Autosize     = 1

$MessageTextBoxLabel.Location  = New-Object System.Drawing.Point(10,73)
$MessageTextBoxLabel.Text      = "Заглавление"
$MessageTextBoxLabel.Autosize  = 1
# Плюшка в виде красивой подсказки, делается другим методом вызова, поэтому идет к каждому обьекту в блоке, чтобы не теряться.
$ToolTip.SetToolTip($MessageTextBoxLabel, "Оглавление сообщения, как текст будет виден в начале предложения.шшшш000")

$SignTextBoxLabel.Location     = New-Object System.Drawing.Point(10,103)
$SignTextBoxLabel.Text         = "Сообщение"
$SignTextBoxLabel.Autosize     = 1
$ToolTip.SetToolTip($SignTextBoxLabel, "Нужно что нибдь написать, не отправлять же пустой шаблон сообщения?")

# Описание текстбокса
# Позиция
$ServerTextBox.Location        = New-Object System.Drawing.Point(140,10)
# Источник данных
$ServerTextBox.DataSource      = $Server
# Размер
$ServerTextBox.Width           = 300
# Обработка события - при смене текста в поле, присваиваем переменной новое полученное значение.
$ServerTextBox.add_TextChanged({$Server = $ServerTextBox.Text})
# Индекс порядка перехода по Tab
$ServerTextBox.TabIndex        = 1
$ToolTip.SetToolTip($ServerTextBox, "Куда мы будем отправлять? (* по умолчанию)")

$UserTextBox.Location          = New-Object System.Drawing.Point(140,40)
$UserTextBox.DataSource        = $User
# Не забываем про массив
$UserTextBox.Text              = $User[1]
$UserTextBox.add_TextChanged({$User = $UserTextBox.Text})
$UserTextBox.Width             = 300
$UserTextBox.TabIndex          = 2
$ToolTip.SetToolTip($UserTextBox, "От чьего имени мы будем отправлять?")

# Поле сообщения
$MessageTextBox.Location       = New-Object System.Drawing.Point(140,70)
$MessageTextBox.Text           = $Message
# По клику в поле ввода - автоматически выделяем весь текст, чтобы не надо было
# нажимать удаление
$MessageTextBox.add_click({$MessageTextBox.SelectAll()})
$MessageTextBox.add_TextChanged({$Message = $MessageTextBox.Text})
$MessageTextBox.Width          = 300
$MessageTextBox.TabIndex       = 3
$ToolTip.SetToolTip($MessageTextBox, "Оглавление сообщения")

# Поле подписи - отправляемая переменная уже другая
$SignTextBox.Location          = New-Object System.Drawing.Point(140,103)
$SignTextBox.Text           = $Sign
$SignTextBox.add_click({$SignTextBox.SelectAll()})
$SignTextBox.add_TextChanged({$SignX = $SignTextBox.Text})
$SignTextBox.Width             = 300
$SignTextBox.TabIndex          = 4
$ToolTip.SetToolTip($SignTextBox, "И что мы таки хотим сказать?")

# Кнопка отправки.
$SendButton.Location           = New-Object System.Drawing.Point(10,150)
$SendButton.Text               = "Отправить сообщение"
# Выполняем разделения строк на массивы с разделителем запятая, вызываем функцию отправки сообщения
$SendButton.add_click({ $User  = $UserTextBox.Text.Split(","); $Server = $ServerTextBox.Text.Split(","); $SignX = $SignTextBox.Text; $Message = $MessageTextBox.Text; SendMessage $Server $User $Message $SignX} )
$SendButton.Autosize           = 1
$SendButton.TabIndex           = 5
$ToolTip.SetToolTip($SendButton, "Отправить сообщение на указанный адресс")

# Прописываем блокировочный чекбокс
$TestRunCheckBox.Location      = New-Object System.Drawing.Point(200,150)
$TestRunCheckBox.Text          = "Тест"
$TestRunCheckBox.Checked       = 1
$TestRunCheckBox.AutoSize      = 1
$TestRunCheckBox.TabIndex      = 6
$ToolTip.SetToolTip($TestRunCheckBox, "Сними меня, а то работать не будет, наверное...")

# Кнопочка выхода, по событию вызывает метод закрытия
$CloseButton.Location          = New-Object System.Drawing.Point(315,150)
$CloseButton.Text              = "Выйти из программы"
$CloseButton.add_click({$MainSendWindow.Close()})
$CloseButton.Autosize          = 1
$CloseButton.TabIndex          = 7
$ToolTip.SetToolTip($CloseButton, "Пойдем ка отсюда")

# Несколько найденых красивостей
# $Win.ControlBox           = 0 # Отключить кнопки свернуть, минимизацию и закрытие.
# $Win.ShowIcon             = 0
# $Win.ShowInTaskbar        = 0
# $Win.HelpButton           = 1
# Авторазмер может отрабатывать если вся форма - к примеру одна кнопка "Сделать хорошо"
# $Win.Autosize             = 1
# $Win.AutoSizeMode         = "GrowAndShrink"
# стиль обрамления и шрифт.
# $Win.FormBorderStyle      = "Fixed3D"
# $Win.Font                 = New-Object System.Drawing.Font("Verdana",32)

# Provide Custom Code for events specified in PrimalForms. 
$menuItem2_OnClick= 
{ 
# Позволяет взглянуть версию Windows (Об версии Windows) 
Invoke-Item "$ENV:Windir\System32\Winver.exe"
} 
$menuItem3_OnClick= 
{ 
# Отрывает Системный монитор
Invoke-Item "$ENV:windir\System32\perfmon.exe" 
} 
$menuItem4_OnClick= 
{ 
# Позволяет открыть связанный файл
. (Join-Path $PSScriptRoot 'Progress Bar.ps1')
} 
$menuItem5_OnClick= 
{ 
# Позволяет открыть связанный файл
. (Join-Path $PSScriptRoot 'About.ps1')
} 

$Menu.MenuItems.Add($menuItem1)
$menuItem1.MenuItems.Add($menuItem2)
$menuItem2.add_Click($menuItem2_OnClick)
$menuItem1.MenuItems.Add($menuItem3)
$menuItem3.add_Click($menuItem3_OnClick)
$Menu.MenuItems.Add($menuItem4)
$menuItem4.add_Click($menuItem4_OnClick)
$Menu.MenuItems.Add($menuItem5)
$menuItem5.add_Click($menuItem5_OnClick)
$menuItem1.Text= 'Файл'
$menuItem2.Text= 'Об версии Windows'
$menuItem3.Text= 'Системный монитор'
$menuItem4.Text= 'Индикатор Прогресса'
$menuItem5.Text= 'Об Авторе'

# Добавляем контролы в форму и вызываем её запуск
$MainSendWindow.Menu= $Menu

$MainSendWindow.Controls.Add($SendButton)
$MainSendWindow.Controls.Add($TestRunCheckBox)
$MainSendWindow.Controls.Add($CloseButton)

$MainSendWindow.Controls.Add($ServerTextBox)
$MainSendWindow.Controls.Add($UserTextBox)
$MainSendWindow.Controls.Add($MessageTextBox)
$MainSendWindow.Controls.Add($SignTextBox)

$MainSendWindow.Controls.Add($ServerTextBoxLabel)
$MainSendWindow.Controls.Add($UserTextBoxLabel)
$MainSendWindow.Controls.Add($MessageTextBoxLabel)
$MainSendWindow.Controls.Add($SignTextBoxLabel)

$MainSendWindow.ShowDialog() | Out-Null
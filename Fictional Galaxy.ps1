# Подключаем то, с помощью чего будем рисовать нашу форму
Add-Type -assembly System.Windows.Forms

# Главная форма
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Имя'
$main_form.Width = 100
$main_form.Height = 100
$main_form.AutoSize = $true

$Menu = New-Object System.Windows.Forms.MainMenu
$menuItem1= New-Object System.Windows.Forms.menuItem
$menuItem2= New-Object System.Windows.Forms.menuItem
$menuItem3= New-Object System.Windows.Forms.menuItem

$Menu.MenuItems.Add($menuItem1)
$menuItem1.MenuItems.Add($menuItem2)
$Menu.MenuItems.Add($menuItem3)
$menuItem1.Text= 'Меню 1'
$menuItem2.Text= 'Подменю'
$menuItem3.Text= 'Меню 3'
$main_form.Menu= $Menu

$main_form.ShowDialog()
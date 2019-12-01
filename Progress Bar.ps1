Add-Type -AssemblyName System.Windows.Forms

$form_main = New-Object System.Windows.Forms.Form
$progressBar1 = New-Object System.Windows.Forms.ProgressBar

$form_main.Text = 'ProgressBar demo'

$progressBar1.Location = new-object System.Drawing.Size(10,10)
$progressBar1.DataBindings.DefaultDataSourceUpdateMode = 0
$progressBar1.Step = 1
$ProgressBar1.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$ProgressBar1.TabIndex = 1
$ProgressBar1.Value = 50
$progressBar1.Name = 'progressBar1'

$HScrollBar1.Location = New-Object System.Drawing.Point(10,40)
$HScrollBar1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @(100,18))
$HScrollBar1.TabIndex = 0
$HScrollBar1.Value = 50
$HScrollBar1.Name = 'HScrollBar1'

if($HScrollBar1.Value -ne $ProgressBar1.Value){$ProgressBar1.Value = $HScrollBar1.Value}

$form_main.Controls.Add($HScrollBar1)
$form_main.Controls.Add($progressBar1)
$form_main.ShowDialog()| Out-Null
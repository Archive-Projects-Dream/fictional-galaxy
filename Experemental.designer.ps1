$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.HScrollBar]$HScrollBar1 = $null
[System.Windows.Forms.ProgressBar]$ProgressBar1 = $null
[System.Windows.Forms.RadioButton]$RadioButton1 = $null
[System.Windows.Forms.CheckedListBox]$CheckedListBox1 = $null
[System.Windows.Forms.CheckBox]$CheckBox1 = $null
function InitializeComponent
{
$HScrollBar1 = (New-Object -TypeName System.Windows.Forms.HScrollBar)
$ProgressBar1 = (New-Object -TypeName System.Windows.Forms.ProgressBar)
$RadioButton1 = (New-Object -TypeName System.Windows.Forms.RadioButton)
$CheckedListBox1 = (New-Object -TypeName System.Windows.Forms.CheckedListBox)
$CheckBox1 = (New-Object -TypeName System.Windows.Forms.CheckBox)
$Form1.SuspendLayout()
#
#HScrollBar1
#
$HScrollBar1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]9))
$HScrollBar1.Name = [System.String]'HScrollBar1'
$HScrollBar1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]18))
$HScrollBar1.TabIndex = [System.Int32]0
#
#ProgressBar1
#
$ProgressBar1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]39))
$ProgressBar1.Name = [System.String]'ProgressBar1'
$ProgressBar1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]23))
$ProgressBar1.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$ProgressBar1.TabIndex = [System.Int32]1
$ProgressBar1.Value = [System.Int32]100
#
#RadioButton1
#
$RadioButton1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]135,[System.Int32]12))
$RadioButton1.Name = [System.String]'RadioButton1'
$RadioButton1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]104,[System.Int32]24))
$RadioButton1.TabIndex = [System.Int32]2
$RadioButton1.TabStop = $true
$RadioButton1.Text = [System.String]'RadioButton1'
$RadioButton1.UseCompatibleTextRendering = $true
$RadioButton1.UseVisualStyleBackColor = $true
#
#CheckedListBox1
#
$CheckedListBox1.FormattingEnabled = $true
$CheckedListBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]135,[System.Int32]130))
$CheckedListBox1.Name = [System.String]'CheckedListBox1'
$CheckedListBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]120,[System.Int32]84))
$CheckedListBox1.TabIndex = [System.Int32]3
$CheckedListBox1.UseCompatibleTextRendering = $true
#
#CheckBox1
#
$CheckBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]135,[System.Int32]42))
$CheckBox1.Name = [System.String]'CheckBox1'
$CheckBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]104,[System.Int32]24))
$CheckBox1.TabIndex = [System.Int32]4
$CheckBox1.Text = [System.String]'CheckBox1'
$CheckBox1.UseCompatibleTextRendering = $true
$CheckBox1.UseVisualStyleBackColor = $true
#
#Form1
#
$Form1.BackColor = [System.Drawing.SystemColors]::GradientInactiveCaption
$Form1.Controls.Add($CheckBox1)
$Form1.Controls.Add($CheckedListBox1)
$Form1.Controls.Add($RadioButton1)
$Form1.Controls.Add($ProgressBar1)
$Form1.Controls.Add($HScrollBar1)
$Form1.ForeColor = [System.Drawing.Color]::White
$Form1.StartPosition = [System.Windows.Forms.FormStartPosition]::WindowsDefaultBounds
$Form1.Text = [System.String]'About'
$Form1.ResumeLayout($false)
Add-Member -InputObject $Form1 -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name HScrollBar1 -Value $HScrollBar1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ProgressBar1 -Value $ProgressBar1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name RadioButton1 -Value $RadioButton1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name CheckedListBox1 -Value $CheckedListBox1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name CheckBox1 -Value $CheckBox1 -MemberType NoteProperty
}
. InitializeComponent

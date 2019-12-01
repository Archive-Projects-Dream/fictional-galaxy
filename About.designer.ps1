$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.HScrollBar]$HScrollBar1 = $null
[System.Windows.Forms.ProgressBar]$ProgressBar1 = $null
function InitializeComponent
{
$HScrollBar1 = (New-Object -TypeName System.Windows.Forms.HScrollBar)
$ProgressBar1 = (New-Object -TypeName System.Windows.Forms.ProgressBar)
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
#Form1
#
$Form1.BackColor = [System.Drawing.SystemColors]::GradientInactiveCaption
$Form1.Controls.Add($ProgressBar1)
$Form1.Controls.Add($HScrollBar1)
$Form1.ForeColor = [System.Drawing.Color]::White
$Form1.StartPosition = [System.Windows.Forms.FormStartPosition]::WindowsDefaultBounds
$Form1.Text = [System.String]'About'
$Form1.ResumeLayout($false)
Add-Member -InputObject $Form1 -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name HScrollBar1 -Value $HScrollBar1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ProgressBar1 -Value $ProgressBar1 -MemberType NoteProperty
}
. InitializeComponent

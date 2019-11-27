$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.MenuStrip]$MenuStrip1 = $null
[System.Windows.Forms.ToolStripMenuItem]$ToolStripMenuItem2 = $null
[System.Windows.Forms.ToolStripMenuItem]$ToolStripMenuItem3 = $null
[System.Windows.Forms.ToolStripMenuItem]$ToolStripMenuItem1 = $null
function InitializeComponent
{
$MenuStrip1 = (New-Object -TypeName System.Windows.Forms.MenuStrip)
$ToolStripMenuItem1 = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$ToolStripMenuItem2 = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$ToolStripMenuItem3 = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$MenuStrip1.SuspendLayout()
$Form1.SuspendLayout()
#
#MenuStrip1
#
$MenuStrip1.Items.AddRange([System.Windows.Forms.ToolStripItem[]]@($ToolStripMenuItem2,$ToolStripMenuItem3))
$MenuStrip1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$MenuStrip1.Name = [System.String]'MenuStrip1'
$MenuStrip1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]284,[System.Int32]24))
$MenuStrip1.TabIndex = [System.Int32]0
$MenuStrip1.Text = [System.String]'MenuStrip1'
#
#ToolStripMenuItem1
#
$ToolStripMenuItem1.Name = [System.String]'ToolStripMenuItem1'
$ToolStripMenuItem1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]45,[System.Int32]20))
$ToolStripMenuItem1.Text = [System.String]'Файл'
#
#ToolStripMenuItem2
#
$ToolStripMenuItem2.Name = [System.String]'ToolStripMenuItem2'
$ToolStripMenuItem2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]123,[System.Int32]20))
$ToolStripMenuItem2.Text = [System.String]'ToolStripMenuItem2'
#
#ToolStripMenuItem3
#
$ToolStripMenuItem3.Name = [System.String]'ToolStripMenuItem3'
$ToolStripMenuItem3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]123,[System.Int32]20))
$ToolStripMenuItem3.Text = [System.String]'ToolStripMenuItem3'
#
#Form1
#
$Form1.Controls.Add($MenuStrip1)
$Form1.MainMenuStrip = $MenuStrip1
$Form1.Text = [System.String]'Form1'
$MenuStrip1.ResumeLayout($false)
$MenuStrip1.PerformLayout()
$Form1.ResumeLayout($false)
$Form1.PerformLayout()
Add-Member -InputObject $Form1 -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name MenuStrip1 -Value $MenuStrip1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ToolStripMenuItem2 -Value $ToolStripMenuItem2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ToolStripMenuItem3 -Value $ToolStripMenuItem3 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ToolStripMenuItem1 -Value $ToolStripMenuItem1 -MemberType NoteProperty
}
. InitializeComponent

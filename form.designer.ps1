$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Button]$Button1 = $null
function InitializeComponent
{
$Button1 = (New-Object -TypeName System.Windows.Forms.Button)
$Form1.SuspendLayout()
#
#Button1
#
$Button1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]87,[System.Int32]112))
$Button1.Name = [System.String]'Button1'
$Button1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$Button1.TabIndex = [System.Int32]0
$Button1.Text = [System.String]'Click me!'
$Button1.UseCompatibleTextRendering = $true
$Button1.UseVisualStyleBackColor = $true
$Button1.add_Click($Button1_Click)
#
#Form1
#
$Form1.AcceptButton = $Button1
$Form1.Controls.Add($Button1)
$Form1.Text = [System.String]'Form1'
$Form1.ResumeLayout($false)
Add-Member -InputObject $Form1 -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button1 -Value $Button1 -MemberType NoteProperty
}
. InitializeComponent
$Form1 = New-Object -TypeName System.Windows.Forms.Form
function InitializeComponent
{
$resources = Invoke-Expression (Get-Content -Path (Join-Path $PSScriptRoot 'About.resources.psd1') -Raw)
$Form1.SuspendLayout()
#
#Form1
#
$Form1.BackColor = [System.Drawing.SystemColors]::GradientInactiveCaption
$Form1.ForeColor = [System.Drawing.Color]::White
$Form1.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$Form1.StartPosition = [System.Windows.Forms.FormStartPosition]::WindowsDefaultBounds
$Form1.Text = [System.String]'About'
$Form1.ResumeLayout($false)
Add-Member -InputObject $Form1 -Name base -Value $base -MemberType NoteProperty
}
. InitializeComponent

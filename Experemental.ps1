Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'About.designer.ps1')
$Form1.ShowDialog()
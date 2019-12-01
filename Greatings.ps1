Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'Progress Bar.ps1')
$Form1.ShowDialog()

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'Experemental.designer.ps1')
$Form1.ShowDialog()
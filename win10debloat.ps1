Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$ErrorActionPreference = 'SilentlyContinue'
$wshell = New-Object -ComObject Wscript.Shell
$Button = [System.Windows.MessageBoxButton]::YesNoCancel
$ErrorIco = [System.Windows.MessageBoxImage]::Error
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
	Exit
}

# GUI Specs
Write-Host "Checking winget..."

# Check if winget is installed
if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){
    'Winget Already Installed'
}  
else{
    # Installing winget from the Microsoft Store
	Write-Host "Winget not found, installing it now."
    $ResultText.text = "`r`n" +"`r`n" + "Installing Winget... Please Wait"
	Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
	$nid = (Get-Process AppInstaller).Id
	Wait-Process -Id $nid
	Write-Host Winget Installed
    $ResultText.text = "`r`n" +"`r`n" + "Winget Installed - Ready for Next Task"
}

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(1050,1000)
$Form.text                       = "Herramientas de Windows"
$Form.StartPosition              = "CenterScreen"
$Form.TopMost                    = $false
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#e9e9e9")
$Form.AutoScaleDimensions         = '192, 192'
$Form.AutoScaleMode               = "Dpi"
$Form.AutoSize                    = $True
$Form.AutoScroll                  = $True
$Form.ClientSize                  = '1050, 1000'
$Form.FormBorderStyle             = 'FixedSingle'


#$Form.Width                     = $objImage.Width
$Form.Height                     = $objImage.Height
$Form.Width                      = 1350

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Instalar"
$Label1.AutoSize                 = $true
$Label1.width                    = 230
$Label1.height                   = 25
$Label1.location                 = New-Object System.Drawing.Point(76,11)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',24)

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Ajustes Esenciales"
$Label3.AutoSize                 = $true
$Label3.width                    = 230
$Label3.height                   = 25
$Label3.location                 = New-Object System.Drawing.Point(449,11)
$Label3.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',24)

$Label15                         = New-Object system.Windows.Forms.Label
$Label15.text                    = "Actualizacion de Windows"
$Label15.AutoSize                = $true
$Label15.width                   = 25
$Label15.height                  = 10
$Label15.location                = New-Object System.Drawing.Point(900,11)
$Label15.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',24)

$Label10                         = New-Object system.Windows.Forms.Label
$Label10.text                    = "Estado actual:"
$Label10.AutoSize                = $true
$Label10.width                   = 25
$Label10.height                  = 10
$Label10.location                = New-Object System.Drawing.Point(998,448)
$Label10.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',24)

$ResultText                      = New-Object system.Windows.Forms.TextBox
$ResultText.multiline            = $true
$ResultText.width                = 382
$ResultText.height               = 130
$ResultText.location             = New-Object System.Drawing.Point(910,491)
$ResultText.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


$Label11                         = New-Object system.Windows.Forms.Label
$Label11.text                    = "Videos para arreglar Windows"
$Label11.AutoSize                = $true
$Label11.width                   = 25
$Label11.height                  = 10
$Label11.location                = New-Object System.Drawing.Point(990,629)
$Label11.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$urlfixwinstartup                = New-Object system.Windows.Forms.Button
$urlfixwinstartup.text           = "Reparar el inicio de Windows"
$urlfixwinstartup.width          = 232
$urlfixwinstartup.height         = 30
$urlfixwinstartup.location       = New-Object System.Drawing.Point(990,662)
$urlfixwinstartup.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$urlremovevirus                  = New-Object system.Windows.Forms.Button
$urlremovevirus.text             = "Limpiar Virus"
$urlremovevirus.width            = 232
$urlremovevirus.height           = 30
$urlremovevirus.location         = New-Object System.Drawing.Point(990,695)
$urlremovevirus.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$urlcreateiso                    = New-Object system.Windows.Forms.Button
$urlcreateiso.text               = "Crear ISO personalizado"
$urlcreateiso.width              = 232
$urlcreateiso.height             = 30
$urlcreateiso.location           = New-Object System.Drawing.Point(990,720)
$urlcreateiso.Font               = New-Object System.Dirawing.Font('Microsoft Sans Serif',10)

#Contenedor panel 1
$Panel1                          = New-Object system.Windows.Forms.Panel
$Panel1.height                   = 939
$Panel1.width                    = 260
$Panel1.location                 = New-Object System.Drawing.Point(6,54)

#-Contenido del panel 1-

#--utilidades panel 1--
$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Utilidades"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(10,11)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$winterminal                     = New-Object system.Windows.Forms.Button
$winterminal.text                = "Windows Terminal"
$winterminal.width               = 230
$winterminal.height              = 30
$winterminal.location            = New-Object System.Drawing.Point(3,32)
$winterminal.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$powertoys                       = New-Object system.Windows.Forms.Button
$powertoys.text                  = "PowerToys"
$powertoys.width                 = 230
$powertoys.height                = 30
$powertoys.location              = New-Object System.Drawing.Point(4,67)
$powertoys.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$7zip                            = New-Object system.Windows.Forms.Button
$7zip.text                       = "7-Zip"
$7zip.width                      = 230
$7zip.height                     = 30
$7zip.location                   = New-Object System.Drawing.Point(4,102)
$7zip.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$autohotkey                      = New-Object system.Windows.Forms.Button
$autohotkey.text                 = "AutoHotkey---"
$autohotkey.width                = 230
$autohotkey.height               = 30
$autohotkey.location             = New-Object System.Drawing.Point(4,136)
$autohotkey.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$discord                         = New-Object system.Windows.Forms.Button
$discord.text                    = "Discord"
$discord.width                   = 230
$discord.height                  = 30
$discord.location                = New-Object System.Drawing.Point(4,170)
$discord.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$githubdesktop                   = New-Object system.Windows.Forms.Button
$githubdesktop.text              = "Github Desktop"
$githubdesktop.width             = 230
$githubdesktop.height            = 30
$githubdesktop.location          = New-Object System.Drawing.Point(3,203)
$githubdesktop.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$translucenttb                   = New-Object system.Windows.Forms.Button
$translucenttb.text              = "Barra de tareas translucida"
$translucenttb.width             = 230
$translucenttb.height            = 30
$translucenttb.location          = New-Object System.Drawing.Point(3,236)
$translucenttb.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$etcher                          = New-Object system.Windows.Forms.Button
$etcher.text                     = "Etcher USB Creator"
$etcher.width                    = 230
$etcher.height                   = 30
$etcher.location                 = New-Object System.Drawing.Point(3,269)
$etcher.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$putty                           = New-Object system.Windows.Forms.Button
$putty.text                      = "PuTTY & WinSCP"
$putty.width                     = 230
$putty.height                    = 30
$putty.location                  = New-Object System.Drawing.Point(3,302)
$putty.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$advancedipscanner               = New-Object system.Windows.Forms.Button
$advancedipscanner.text          = "Advanced IP Scanner"
$advancedipscanner.width         = 230
$advancedipscanner.height        = 30
$advancedipscanner.location      = New-Object System.Drawing.Point(3,335)
$advancedipscanner.Font          = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$everythingsearch                = New-Object system.Windows.Forms.Button
$everythingsearch.text           = "Buscar Todo"
$everythingsearch.width          = 230
$everythingsearch.height         = 30
$everythingsearch.location       = New-Object System.Drawing.Point(3,368)
$everythingsearch.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
#--Fin utilidades panel 1--


#--Navegadores Web panel 1--
$Label9                          = New-Object system.Windows.Forms.Label
$Label9.text                     = "Navegadores web"
$Label9.AutoSize                 = $true
$Label9.width                    = 25
$Label9.height                   = 10
$Label9.location                 = New-Object System.Drawing.Point(10,406)
$Label9.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$brave                           = New-Object system.Windows.Forms.Button
$brave.text                      = "Brave Browser"
$brave.width                     = 230
$brave.height                    = 30
$brave.location                  = New-Object System.Drawing.Point(4,426)
$brave.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$firefox                         = New-Object system.Windows.Forms.Button
$firefox.text                    = "Firefox"
$firefox.width                   = 230
$firefox.height                  = 30
$firefox.location                = New-Object System.Drawing.Point(4,461)
$firefox.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$gchrome                         = New-Object system.Windows.Forms.Button
$gchrome.text                    = "Google Chrome"
$gchrome.width                   = 230
$gchrome.height                  = 30
$gchrome.location                = New-Object System.Drawing.Point(3,494)
$gchrome.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
#--FIN Navegadores Web panel 1--


#--Herramientas de video e imagen panel 1--
$Label8                          = New-Object system.Windows.Forms.Label
$Label8.text                     = "Herramientas de video e imagen"
$Label8.AutoSize                 = $true
$Label8.width                    = 25
$Label8.height                   = 10
$Label8.location                 = New-Object System.Drawing.Point(10,537)
$Label8.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$sharex                          = New-Object system.Windows.Forms.Button
$sharex.text                     = "ShareX (Screenshots)"
$sharex.width                    = 230
$sharex.height                   = 30
$sharex.location                 = New-Object System.Drawing.Point(3,561)
$sharex.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$imageglass                      = New-Object system.Windows.Forms.Button
$imageglass.text                 = "ImageGlass (Image Viewer)"
$imageglass.width                = 230
$imageglass.height               = 30
$imageglass.location             = New-Object System.Drawing.Point(4,595)
$imageglass.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',12)


$gimp                            = New-Object system.Windows.Forms.Button
$gimp.text                       = "GIMP (Image Editor)"
$gimp.width                      = 230
$gimp.height                     = 30
$gimp.location                   = New-Object System.Drawing.Point(4,629)
$gimp.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$vlc                             = New-Object system.Windows.Forms.Button
$vlc.text                        = "VLC"
$vlc.width                       = 230
$vlc.height                      = 30
$vlc.location                    = New-Object System.Drawing.Point(3,663)
$vlc.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$mpc                             = New-Object system.Windows.Forms.Button
$mpc.text                        = "Media Player Classic"
$mpc.width                       = 230
$mpc.height                      = 30
$mpc.location                    = New-Object System.Drawing.Point(3,697)
$mpc.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
#--FIN Herramientas de video e imagen panel 1--


#--Herramientas de documetos panel 1--
$Label7                          = New-Object system.Windows.Forms.Label
$Label7.text                     = "Herramientas de documentos"
$Label7.AutoSize                 = $true
$Label7.width                    = 25
$Label7.height                   = 10
$Label7.location                 = New-Object System.Drawing.Point(10,740)
$Label7.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$vscodium                        = New-Object system.Windows.Forms.Button
$vscodium.text                   = "VS Codium"
$vscodium.width                  = 230
$vscodium.height                 = 30
$vscodium.location               = New-Object System.Drawing.Point(4,763)
$vscodium.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$vscode                          = New-Object system.Windows.Forms.Button
$vscode.text                     = "VS Code"
$vscode.width                    = 230
$vscode.height                   = 30
$vscode.location                 = New-Object System.Drawing.Point(4,797)
$vscode.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$notepad                         = New-Object system.Windows.Forms.Button
$notepad.text                    = "Notepad++"
$notepad.width                   = 230
$notepad.height                  = 30
$notepad.location                = New-Object System.Drawing.Point(3,831)
$notepad.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$adobereader                     = New-Object system.Windows.Forms.Button
$adobereader.text                = "Adobe Reader DC"
$adobereader.width               = 230
$adobereader.height              = 30
$adobereader.location            = New-Object System.Drawing.Point(3,865)
$adobereader.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$sumatrapdf                      = New-Object system.Windows.Forms.Button
$sumatrapdf.text                 = "Sumatra PDF"
$sumatrapdf.width                = 230
$sumatrapdf.height               = 30
$sumatrapdf.location             = New-Object System.Drawing.Point(4,900)
$sumatrapdf.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
#--FIN Herramientas de documentos panel 1--
#-Contenido del panel 1-

#Contenedor panel 2
$Panel2                          = New-Object system.Windows.Forms.Panel
$Panel2.height                   = 938
$Panel2.width                    = 310
$Panel2.location                 = New-Object System.Drawing.Point(300,54)

#-Contenido del panel 2-
$essentialtweaks                 = New-Object system.Windows.Forms.Button
$essentialtweaks.text            = "Deshabilitar Ajustes esenciales"
$essentialtweaks.width           = 270
$essentialtweaks.height          = 60
$essentialtweaks.location        = New-Object System.Drawing.Point(0,17)
$essentialtweaks.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',14)

$essentialundo                   = New-Object system.Windows.Forms.Button
$essentialundo.text              = "Habilitar ajustes esenciales"
$essentialundo.width             = 270
$essentialundo.height            = 60
$essentialundo.location          = New-Object System.Drawing.Point(3,80)
$essentialundo.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',14)

$actioncenter                    = New-Object system.Windows.Forms.Button
$actioncenter.text               = "Desactivar centro de accion"
$actioncenter.width              = 270
$actioncenter.height             = 30
$actioncenter.location           = New-Object System.Drawing.Point(3,146)
$actioncenter.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$EActionCenter                   = New-Object system.Windows.Forms.Button
$EActionCenter.text              = "Habilitar Centro de actividades"
$EActionCenter.width             = 270
$EActionCenter.height            = 30
$EActionCenter.location          = New-Object System.Drawing.Point(3,180)
$EActionCenter.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$STrayIcons                      = New-Object system.Windows.Forms.Button
$STrayIcons.text                 = "Mostrar iconos de la bandeja"
$STrayIcons.width                = 270
$STrayIcons.height               = 30
$STrayIcons.location             = New-Object System.Drawing.Point(2,214)
$STrayIcons.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$HTrayIcons                      = New-Object system.Windows.Forms.Button
$HTrayIcons.text                 = "Ocultar iconos de la bandeja"
$HTrayIcons.width                = 270
$HTrayIcons.height               = 30
$HTrayIcons.location             = New-Object System.Drawing.Point(3,248)
$HTrayIcons.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$darkmode                        = New-Object system.Windows.Forms.Button
$darkmode.text                   = "Modo oscuro"
$darkmode.width                  = 270
$darkmode.height                 = 30
$darkmode.location               = New-Object System.Drawing.Point(4,285)
$darkmode.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$lightmode                       = New-Object system.Windows.Forms.Button
$lightmode.text                  = "Modo claro"
$lightmode.width                 = 270
$lightmode.height                = 30
$lightmode.location              = New-Object System.Drawing.Point(3,320)
$lightmode.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$appearancefx                    = New-Object system.Windows.Forms.Button
$appearancefx.text               = "Habilitar Efectos visuales"
$appearancefx.width              = 270
$appearancefx.height             = 30
$appearancefx.location           = New-Object System.Drawing.Point(4,355)
$appearancefx.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$performancefx                   = New-Object system.Windows.Forms.Button
$performancefx.text              = "Rendimiento de Efectos visuales"
$performancefx.width             = 270
$performancefx.height            = 30
$performancefx.location          = New-Object System.Drawing.Point(3,389)
$performancefx.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$backgroundapps                  = New-Object system.Windows.Forms.Button
$backgroundapps.text             = "Deshabilitar App en segundo plano"
$backgroundapps.width            = 270
$backgroundapps.height           = 30
$backgroundapps.location         = New-Object System.Drawing.Point(3,423)
$backgroundapps.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$RBackgroundApps                 = New-Object system.Windows.Forms.Button
$RBackgroundApps.text            = "Permitir App en segundo plano"
$RBackgroundApps.width           = 270
$RBackgroundApps.height          = 30
$RBackgroundApps.location        = New-Object System.Drawing.Point(3,457)
$RBackgroundApps.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$onedrive                        = New-Object system.Windows.Forms.Button
$onedrive.text                   = "Eliminar y deshabilitar OneDrive"
$onedrive.width                  = 270
$onedrive.height                 = 30
$onedrive.location               = New-Object System.Drawing.Point(3,491)
$onedrive.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$InstallOneDrive                 = New-Object system.Windows.Forms.Button
$InstallOneDrive.text            = "Instalar y habilitar OneDrive"
$InstallOneDrive.width           = 270
$InstallOneDrive.height          = 30
$InstallOneDrive.location        = New-Object System.Drawing.Point(2,524)
$InstallOneDrive.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$cortana                         = New-Object system.Windows.Forms.Button
$cortana.text                    = "Deshabilitar Cortana (Search)"
$cortana.width                   = 270
$cortana.height                  = 30
$cortana.location                = New-Object System.Drawing.Point(2,558)
$cortana.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$ECortana                        = New-Object system.Windows.Forms.Button
$ECortana.text                   = "Habilitar Cortana (Search)"
$ECortana.width                  = 270
$ECortana.height                 = 30
$ECortana.location               = New-Object System.Drawing.Point(3,592)
$ECortana.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$ELocation                       = New-Object system.Windows.Forms.Button
$ELocation.text                  = "Habilitar seguimiento de ubicacion"
$ELocation.width                 = 270
$ELocation.height                = 30
$ELocation.location              = New-Object System.Drawing.Point(2,625)
$ELocation.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$EClipboardHistory               = New-Object system.Windows.Forms.Button
$EClipboardHistory.text          = "Habilitar historial del portapapeles"
$EClipboardHistory.width         = 270
$EClipboardHistory.height        = 30
$EClipboardHistory.location      = New-Object System.Drawing.Point(3,658)
$EClipboardHistory.Font          = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$EHibernation                    = New-Object system.Windows.Forms.Button
$EHibernation.text               = "Habilitar hibernacion"
$EHibernation.width              = 270
$EHibernation.height             = 30
$EHibernation.location           = New-Object System.Drawing.Point(3,691)
$EHibernation.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$dualboottime                    = New-Object system.Windows.Forms.Button
$dualboottime.text               = "Establecer hora en UTC (arranque doble)"
$dualboottime.width              = 270
$dualboottime.height             = 50
$dualboottime.location           = New-Object System.Drawing.Point(3,724)
$dualboottime.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$reinstallbloat                  = New-Object system.Windows.Forms.Button
$reinstallbloat.text             = "Reinstalar App de la tienda MS"
$reinstallbloat.width            = 270
$reinstallbloat.height           = 30
$reinstallbloat.location         = New-Object System.Drawing.Point(3,778)
$reinstallbloat.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$WarningLabel                    = New-Object system.Windows.Forms.Label
$WarningLabel.text               = "¡Advertencia! Esto rompera Microsoft Store"
$WarningLabel.AutoSize           = $true
$WarningLabel.width              = 25
$WarningLabel.height             = 10
$WarningLabel.location           = New-Object System.Drawing.Point(14,812)
$WarningLabel.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',8)

$Label5                          = New-Object system.Windows.Forms.Label
$Label5.text                     = "Games, Apps, preparacion del sistema, etc."
$Label5.AutoSize                 = $true
$Label5.width                    = 25
$Label5.height                   = 10
$Label5.location                 = New-Object System.Drawing.Point(14,832)
$Label5.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',8)

$removebloat                     = New-Object system.Windows.Forms.Button
$removebloat.text                = "Eliminar App de la tienda MS"
$removebloat.width               = 270
$removebloat.height              = 30
$removebloat.location            = New-Object System.Drawing.Point(3,850)
$removebloat.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
#-FIN Contenido del panel 2-

#Contenedor panel 3
$Panel3                          = New-Object system.Windows.Forms.Panel
$Panel3.height                   = 391
$Panel3.width                    = 260
$Panel3.location                 = New-Object System.Drawing.Point(605,54)


#-Contenido del panel 3-
$Virtualization                  = New-Object system.Windows.Forms.Button
$Virtualization.text             = "Habilitar HyperV + WSL"
$Virtualization.width            = 240
$Virtualization.height           = 30
$Virtualization.location         = New-Object System.Drawing.Point(4,23)
$Virtualization.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$NFS                             = New-Object system.Windows.Forms.Button
$NFS.text                        = "Habilitar NFS"
$NFS.width                       = 240
$NFS.height                      = 30
$NFS.location                    = New-Object System.Drawing.Point(4,57)
$NFS.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$laptopnumlock                   = New-Object system.Windows.Forms.Button
$laptopnumlock.text              = "Reparacion del bloqueo numerico portatil"
$laptopnumlock.width             = 240
$laptopnumlock.height            = 60
$laptopnumlock.location          = New-Object System.Drawing.Point(4,92)
$laptopnumlock.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$ncpa                            = New-Object system.Windows.Forms.Button
$ncpa.text                       = "Conexiones de red"
$ncpa.width                      = 240
$ncpa.height                     = 30
$ncpa.location                   = New-Object System.Drawing.Point(4,156)
$ncpa.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$restorepower                    = New-Object system.Windows.Forms.Button
$restorepower.text               = "Restaurar opciones de energia"
$restorepower.width              = 240
$restorepower.height             = 30
$restorepower.location           = New-Object System.Drawing.Point(4,189)
$restorepower.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$oldcontrolpanel                 = New-Object system.Windows.Forms.Button
$oldcontrolpanel.text            = "Panel de control Win7"
$oldcontrolpanel.width           = 240
$oldcontrolpanel.height          = 30
$oldcontrolpanel.location        = New-Object System.Drawing.Point(4,223)
$oldcontrolpanel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$oldpower                        = New-Object system.Windows.Forms.Button
$oldpower.text                   = "Panel de alimentacion Win7"
$oldpower.width                  = 240
$oldpower.height                 = 30
$oldpower.location               = New-Object System.Drawing.Point(4,257)
$oldpower.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$oldsoundpanel                   = New-Object system.Windows.Forms.Button
$oldsoundpanel.text              = "Panel de sonido Win7"
$oldsoundpanel.width             = 240
$oldsoundpanel.height            = 30
$oldsoundpanel.location          = New-Object System.Drawing.Point(5,292)
$oldsoundpanel.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$oldsystempanel                  = New-Object system.Windows.Forms.Button
$oldsystempanel.text             = "Panel del sistema Win7"
$oldsystempanel.width            = 240
$oldsystempanel.height           = 30
$oldsystempanel.location         = New-Object System.Drawing.Point(5,328)
$oldsystempanel.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',12)

$yourphonefix                    = New-Object system.Windows.Forms.Button
$yourphonefix.text               = "Reparacion de App de telefono"
$yourphonefix.width              = 240
$yourphonefix.height             = 30
$yourphonefix.location           = New-Object System.Drawing.Point(5,362)
$yourphonefix.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
#-Fin Contenido del panel 3-

#Contenedor panel 4
$Panel4                          = New-Object system.Windows.Forms.Panel
$Panel4.height                   = 328
$Panel4.width                    = 380
$Panel4.location                 = New-Object System.Drawing.Point(900,54)


#-Contenido del panel 4-
$defaultwindowsupdate            = New-Object system.Windows.Forms.Button
$defaultwindowsupdate.text       = "Configuracion por defecto"
$defaultwindowsupdate.width      = 320
$defaultwindowsupdate.height     = 30
$defaultwindowsupdate.location   = New-Object System.Drawing.Point(24,26)
$defaultwindowsupdate.Font       = New-Object System.Drawing.Font('Microsoft Sans Serif',14)

$Label16                         = New-Object system.Windows.Forms.Label
$Label16.text                    = "Recomiendo hacer solo actualizaciones de seguridad."
$Label16.AutoSize                = $true
$Label16.width                   = 25
$Label16.height                  = 10
$Label16.location                = New-Object System.Drawing.Point(25,65)
$Label16.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label17                         = New-Object system.Windows.Forms.Label
$Label17.text                    = "- Actualizaciones de caracteristicas de retrasos hasta 3 anos"
$Label17.AutoSize                = $true
$Label17.width                   = 25
$Label17.height                  = 10
$Label17.location                = New-Object System.Drawing.Point(20,84)
$Label17.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label18                         = New-Object system.Windows.Forms.Label
$Label18.text                    = "- Retrasa las actualizaciones de seguridad 4 dias"
$Label18.AutoSize                = $true
$Label18.width                   = 25
$Label18.height                  = 10
$Label18.location                = New-Object System.Drawing.Point(20,105)
$Label18.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label19                         = New-Object system.Windows.Forms.Label
$Label19.text                    = "- Establece el tiempo activo maximo"
$Label19.AutoSize                = $true
$Label19.width                   = 25
$Label19.height                  = 10
$Label19.location                = New-Object System.Drawing.Point(20,126)
$Label19.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$securitywindowsupdate           = New-Object system.Windows.Forms.Button
$securitywindowsupdate.text      = "Solo actualizaciones de seguridad"
$securitywindowsupdate.width     = 320
$securitywindowsupdate.height    = 30
$securitywindowsupdate.location  = New-Object System.Drawing.Point(24,142)
$securitywindowsupdate.Font      = New-Object System.Drawing.Font('Microsoft Sans Serif',14)

$enableupdates                   = New-Object system.Windows.Forms.Button
$enableupdates.text              = "Habilitar servicios de actualizacion"
$enableupdates.width             = 320
$enableupdates.height            = 30
$enableupdates.location          = New-Object System.Drawing.Point(25,179)
$enableupdates.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',14)

$windowsupdatefix                = New-Object system.Windows.Forms.Button
$windowsupdatefix.text           = "Reset de actualizacion de Windows"
$windowsupdatefix.width          = 320
$windowsupdatefix.height         = 30
$windowsupdatefix.location       = New-Object System.Drawing.Point(25,216)
$windowsupdatefix.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',14)

$Label12                         = New-Object system.Windows.Forms.Label
$Label12.text                    = "NO RECOMENDADO !!!"
$Label12.AutoSize                = $true
$Label12.width                   = 25
$Label12.height                  = 10
$Label12.location                = New-Object System.Drawing.Point(98,275)
$Label12.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$disableupdates                  = New-Object system.Windows.Forms.Button
$disableupdates.text             = "Deshabilitar servicios de actualizacion"
$disableupdates.width            = 320
$disableupdates.height           = 30
$disableupdates.location         = New-Object System.Drawing.Point(23,292)
$disableupdates.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',14)
#-FIN Contenido del panel 4-

$Form.controls.AddRange(@($Panel1,$Panel2,$Panel3,$Panel4,$Label3,$Label15,$Label1,$ResultText,$Label10,$Label11,$urlfixwinstartup,$urlremovevirus,$urlcreateiso))
$Panel1.controls.AddRange(@($brave,$firefox,$7zip,$sharex,$adobereader,$notepad,$gchrome,$mpc,$vlc,$powertoys,$winterminal,$vscode,$Label2,$everythingsearch,$sumatrapdf,$vscodium,$imageglass,$gimp,$Label7,$Label8,$Label9,$advancedipscanner,$putty,$etcher,$translucenttb,$githubdesktop,$discord,$autohotkey))
$Panel2.controls.AddRange(@($essentialtweaks,$backgroundapps,$cortana,$actioncenter,$darkmode,$performancefx,$onedrive,$lightmode,$essentialundo,$EActionCenter,$ECortana,$RBackgroundApps,$HTrayIcons,$EClipboardHistory,$ELocation,$InstallOneDrive,$removebloat,$reinstallbloat,$WarningLabel,$Label5,$appearancefx,$STrayIcons,$EHibernation,$dualboottime))
$Panel3.controls.AddRange(@($yourphonefix,$ncpa,$oldcontrolpanel,$oldsoundpanel,$oldsystempanel,$NFS,$laptopnumlock,$Virtualization,$oldpower,$restorepower))
$Panel4.controls.AddRange(@($defaultwindowsupdate,$securitywindowsupdate,$Label16,$Label17,$Label18,$Label19,$windowsupdatefix,$disableupdates,$enableupdates,$Label12))


$brave.Add_Click({
    Write-Host "Installing Brave Browser"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Brave... Please Wait" 
    winget install -e BraveSoftware.BraveBrowser | Out-Host
    if($?) { Write-Host "Installed Brave Browser" }
    $ResultText.text = "`r`n" + "Finished Installing Brave" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$firefox.Add_Click({
    Write-Host "Installing Firefox"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Firefox... Please Wait" 
    winget install -e Mozilla.Firefox | Out-Host
    if($?) { Write-Host "Installed Firefox" }
    $ResultText.text = "`r`n" + "Finished Installing Firefox" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$gchrome.Add_Click({
    Write-Host "Installing Google Chrome"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Google Chrome... Please Wait" 
    winget install -e Google.Chrome | Out-Host
    if($?) { Write-Host "Installed Google Chrome" }
    $ResultText.text = "`r`n" + "Finished Installing Google Chrome" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$autohotkey.Add_Click({
    Write-Host "Installing AutoHotkey"
    $ResultText.text = "`r`n" +"`r`n" + "Installing AutoHotkey... Please Wait" 
    winget install -e Lexikos.AutoHotkey | Out-Host
    if($?) { Write-Host "Installed AutoHotkey" }
    $ResultText.text = "`r`n" + "Finished Installing Autohotkey" + "`r`n" + "`r`n" + "Ready for Next Task"
})
$imageglass.Add_Click({
    Write-Host "Installing Image Glass (Image Viewer)"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Image Glass... Please Wait" 
    winget install -e DuongDieuPhap.ImageGlass | Out-Host
    if($?) { Write-Host "Installed Image Glass (Image Viewer)" }
    $ResultText.text = "`r`n" + "Finished Installing Image Glass" + "`r`n" + "`r`n" + "Ready for Next Task"
})
$discord.Add_Click({
    Write-Host "Installing Discord"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Discord... Please Wait" 
    winget install -e Discord.Discord | Out-Host
    if($?) { Write-Host "Installed Discord" }
    $ResultText.text = "`r`n" + "Finished Installing Discord" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$adobereader.Add_Click({
    Write-Host "Installing Adobe Reader DC"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Adobe Reader DC... Please Wait" 
    winget install -e --id Adobe.Acrobat.Reader.64-bit | Out-Host
    if($?) { Write-Host "Installed Adobe Reader DC" }
    $ResultText.text = "`r`n" + "Finished Installing Adobe Reader DC" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$notepad.Add_Click({
    Write-Host "Installing Notepad++"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Notepad++... Please Wait" 
    winget install -e Notepad++.Notepad++ | Out-Host
    if($?) { Write-Host "Installed Notepad++" }
    $ResultText.text = "`r`n" + "Finished Installing NotePad++" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$vlc.Add_Click({
    Write-Host "Installing VLC Media Player"
    $ResultText.text = "`r`n" +"`r`n" + "Installing VLC Media Player... Please Wait" 
    winget install -e VideoLAN.VLC | Out-Host
    if($?) { Write-Host "Installed VLC Media Player" }
    $ResultText.text = "`r`n" + "Finished Installing VLC Media Player" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$mpc.Add_Click({
    Write-Host "Installing Media Player Classic"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Media Player Classic... Please Wait" 
    winget install -e clsid2.mpc-hc | Out-Host
    if($?) { Write-Host "Installed Media Player Classic" }
    $ResultText.text = "`r`n" + "Finished Installing Media Player Classic" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$7zip.Add_Click({
    Write-Host "Installing 7-Zip Compression Tool"
    $ResultText.text = "`r`n" +"`r`n" + "Installing 7-Zip Compression Tool... Please Wait" 
    winget install -e 7zip.7zip | Out-Host
    if($?) { Write-Host "Installed 7-Zip Compression Tool" }
    $ResultText.text = "`r`n" + "Finished Installing 7-Zip Compression Tool" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$vscode.Add_Click({
    Write-Host "Installing Visual Studio Code"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Visual Studio Code... Please Wait" 
    winget install -e Microsoft.VisualStudioCode --source winget | Out-Host
    if($?) { Write-Host "Installed Visual Studio Code" }
    $ResultText.text = "`r`n" + "Finished Installing Visual Studio Code" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$vscodium.Add_Click({
    Write-Host "Installing VS Codium"
    $ResultText.text = "`r`n" +"`r`n" + "Installing VS Codium... Please Wait" 
    winget install -e VSCodium.VSCodium | Out-Host
    if($?) { Write-Host "Installed VS Codium" }
    $ResultText.text = "`r`n" + "Finished Installing VS Codium" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$urlremovevirus.Add_Click({
    Start-Process "https://youtu.be/CHtZ9-9ch2w"
})

$urlfixwinstartup.Add_Click({
    Start-Process "https://youtu.be/sOihh4ZNOf4"
})

$urlcreateiso.Add_Click({
    Start-Process "https://youtu.be/R6XPff38iSc"
})

$winterminal.Add_Click({
    Write-Host "Installing New Windows Terminal"
    $ResultText.text = "`r`n" +"`r`n" + "Installing New Windows Terminal... Please Wait" 
    winget install -e Microsoft.WindowsTerminal | Out-Host
    if($?) { Write-Host "Installed New Windows Terminal" }
    $ResultText.text = "`r`n" + "Finished Installing New Windows Terminal" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$powertoys.Add_Click({
    Write-Host "Installing Microsoft PowerToys"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Microsoft PowerToys... Please Wait" 
    winget install -e Microsoft.PowerToys | Out-Host
    if($?) { Write-Host "Installed Microsoft PowerToys" }
    $ResultText.text = "`r`n" + "Finished Installing Microsoft PowerToys" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$everythingsearch.Add_Click({
    Write-Host "Installing Voidtools Everything Search"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Voidtools Everything Search... Please Wait" 
    winget install -e voidtools.Everything --source winget | Out-Host
    if($?) { Write-Host "Installed Everything Search" }
    $ResultText.text = "`r`n" + "Finished Installing Voidtools Everything Search" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$sumatrapdf.Add_Click({
    Write-Host "Installing Sumatra PDF"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Sumatra PDF... Please Wait" 
    winget install -e SumatraPDF.SumatraPDF | Out-Host
    if($?) { Write-Host "Installed Sumatra PDF" }
    $ResultText.text = "`r`n" + "Finished Installing Sumatra PDF" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$githubdesktop.Add_Click({
    Write-Host "Installing Git and GitHub Desktop"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Git and GitHub Desktop... Please Wait" 
    winget install -e Git.Git | Out-Host
    winget install -e GitHub.GitHubDesktop | Out-Host
    Write-Host "Installed Git and Github Desktop"
    $ResultText.text = "`r`n" + "Finished Installing Git and GitHub Desktop" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$translucenttb.Add_Click({
    Write-Host "Installing Translucent Taskbar"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Translucent Taskbar... Please Wait" 
    winget install -e TranslucentTB.TranslucentTB | Out-Host
    Write-Host "Installed Translucent Taskbar"
    $ResultText.text = "`r`n" + "Finished Installing Translucent Taskbar" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$etcher.Add_Click({
    Write-Host "Installing Etcher USB Imager"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Etcher USB Imager... Please Wait" 
    winget install -e Balena.Etcher | Out-Host
    Write-Host "Installed Etcher USB Imager"
    $ResultText.text = "`r`n" + "Finished Installing Etcher USB Imager" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$putty.Add_Click({
    Write-Host "Installing PuTTY & WinSCP"
    $ResultText.text = "`r`n" +"`r`n" + "Installing PuTTY & WinSCP... Please Wait" 
    winget install -e PuTTY.PuTTY | Out-Host
    winget install -e WinSCP.WinSCP | Out-Host
    Write-Host "Installed PuTTY & WinSCP"
    $ResultText.text = "`r`n" + "Finished Installing PuTTY & WinSCP" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$advancedipscanner.Add_Click({
    Write-Host "Installing Advanced IP Scanner"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Advanced IP Scanner... Please Wait" 
    winget install -e Famatech.AdvancedIPScanner | Out-Host
    Write-Host "Installed Advanced IP Scanner"
    $ResultText.text = "`r`n" + "Finished Installing Advanced IP Scanner" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$sharex.Add_Click({
    Write-Host "Installing ShareX Screenshot Tool"
    $ResultText.text = "`r`n" +"`r`n" + "Installing ShareX Screenshot Tool... Please Wait" 
    winget install -e ShareX.ShareX | Out-Host
    Write-Host "Installed ShareX Screenshot Tool"
    $ResultText.text = "`r`n" + "Finished Installing ShareX Screenshot Tool" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$gimp.Add_Click({
    Write-Host "Installing Gimp Image Editor"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Gimp Image Editor... Please Wait" 
    winget install -e GIMP.GIMP | Out-Host
    Write-Host "Installed Gimp Image Editor"
    $ResultText.text = "`r`n" + "Finished Installing Gimp Image Editor" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$essentialtweaks.Add_Click({
    Write-Host "Creating Restore Point incase something bad happens"
    $ResultText.text = "`r`n" +"`r`n" + "Installing Essential Tools... Please Wait" 
    Enable-ComputerRestore -Drive "C:\"
    Checkpoint-Computer -Description "RestorePoint1" -RestorePointType "MODIFY_SETTINGS"

    Write-Host "Running O&O Shutup with Recommended Settings"
    $ResultText.text += "`r`n" +"Running O&O Shutup with Recommended Settings"
    Import-Module BitsTransfer
    Start-BitsTransfer -Source "https://raw.githubusercontent.com/ChrisTitusTech/win10script/master/ooshutup10.cfg" -Destination ooshutup10.cfg
    Start-BitsTransfer -Source "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -Destination OOSU10.exe
    ./OOSU10.exe ooshutup10.cfg /quiet

    Write-Host "Disabling Telemetry..."
    $ResultText.text += "`r`n" +"Disabling Telemetry..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" | Out-Null
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\ProgramDataUpdater" | Out-Null
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Autochk\Proxy" | Out-Null
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" | Out-Null
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" | Out-Null
    Disable-ScheduledTask -TaskName "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" | Out-Null
    Write-Host "Disabling Wi-Fi Sense..."
    If (!(Test-Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting")) {
        New-Item -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0
    Write-Host "Disabling Application suggestions..."
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "ContentDeliveryAllowed" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "OemPreInstalledAppsEnabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEnabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEverEnabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SilentInstalledAppsEnabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Type DWord -Value 1
    Write-Host "Disabling Activity History..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 0
    # Keep Location Tracking commented out if you want the ability to locate your device
    Write-Host "Disabling Location Tracking..."
    If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location")) {
        New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Type String -Value "Deny"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "SensorPermissionState" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name "Status" -Type DWord -Value 0
    Write-Host "Disabling automatic Maps updates..."
    Set-ItemProperty -Path "HKLM:\SYSTEM\Maps" -Name "AutoUpdateEnabled" -Type DWord -Value 0
    Write-Host "Disabling Feedback..."
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "DoNotShowFeedbackNotifications" -Type DWord -Value 1
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Feedback\Siuf\DmClient" -ErrorAction SilentlyContinue | Out-Null
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" -ErrorAction SilentlyContinue | Out-Null
    Write-Host "Disabling Tailored Experiences..."
    If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
        New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableTailoredExperiencesWithDiagnosticData" -Type DWord -Value 1
    Write-Host "Disabling Advertising ID..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Type DWord -Value 1
    Write-Host "Disabling Error reporting..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Type DWord -Value 1
    Disable-ScheduledTask -TaskName "Microsoft\Windows\Windows Error Reporting\QueueReporting" | Out-Null
    Write-Host "Restricting Windows Update P2P only to local network..."
    If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config")) {
        New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -Type DWord -Value 1
    Write-Host "Stopping and disabling Diagnostics Tracking Service..."
    Stop-Service "DiagTrack" -WarningAction SilentlyContinue
    Set-Service "DiagTrack" -StartupType Disabled
    Write-Host "Stopping and disabling WAP Push Service..."
    Stop-Service "dmwappushservice" -WarningAction SilentlyContinue
    Set-Service "dmwappushservice" -StartupType Disabled
    Write-Host "Enabling F8 boot menu options..."
    bcdedit /set `{current`} bootmenupolicy Legacy | Out-Null
    Write-Host "Stopping and disabling Home Groups services..."
    Stop-Service "HomeGroupListener" -WarningAction SilentlyContinue
    Set-Service "HomeGroupListener" -StartupType Disabled
    Stop-Service "HomeGroupProvider" -WarningAction SilentlyContinue
    Set-Service "HomeGroupProvider" -StartupType Disabled
    Write-Host "Disabling Remote Assistance..."
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" -Type DWord -Value 0
    Write-Host "Disabling Storage Sense..."
    Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" -Recurse -ErrorAction SilentlyContinue
    Write-Host "Stopping and disabling Superfetch service..."
    Stop-Service "SysMain" -WarningAction SilentlyContinue
    Set-Service "SysMain" -StartupType Disabled
    Write-Host "Disabling Hibernation..."
    Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Power" -Name "HibernteEnabled" -Type Dword -Value 0
    If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings")) {
        New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Name "ShowHibernateOption" -Type Dword -Value 0
    If ((get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name CurrentBuild).CurrentBuild -lt 22557) {
    	Write-Host "Showing task manager details..."
    	$taskmgr = Start-Process -WindowStyle Hidden -FilePath taskmgr.exe -PassThru
    	Do {
      		Start-Sleep -Milliseconds 100
        	$preferences = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -ErrorAction SilentlyContinue
    	} Until ($preferences)
    	Stop-Process $taskmgr
    	$preferences.Preferences[28] = 0
    	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -Type Binary -Value $preferences.Preferences
    } else {Write-Host "Task Manager patch not run in builds 22557+ due to bug"}
    Write-Host "Showing file operations details..."
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" -Name "EnthusiastMode" -Type DWord -Value 1
    Write-Host "Hiding Task View button..."
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 0
    Write-Host "Hiding People icon..."
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 0
    Write-Host "Hide tray icons..."
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableAutoTray" -Type DWord -Value 1
    Write-Host "Enabling NumLock after startup..."
    If (!(Test-Path "HKU:")) {
        New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS | Out-Null
    }
    Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type DWord -Value 2147483650
    Add-Type -AssemblyName System.Windows.Forms
    If (!([System.Windows.Forms.Control]::IsKeyLocked('NumLock'))) {
        $wsh = New-Object -ComObject WScript.Shell
        $wsh.SendKeys('{NUMLOCK}')
    }

    Write-Host "Changing default Explorer view to This PC..."
    $ResultText.text += "`r`n" +"Quality of Life Tweaks"
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Type DWord -Value 1

    Write-Host "Hiding 3D Objects icon from This PC..."
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Recurse -ErrorAction SilentlyContinue

    # reuducing ram via regedit
    Write-Host "Using regedit to improve RAM performace"

    Set-ItemProperty -Path "HKLM:\System\GameConfigStore" -Name "GameDVR_DXGIHonorFSEWindowsCompatible" -Type Hex -Value 00000000
    Set-ItemProperty -Path "HKLM:\System\GameConfigStore" -Name "GameDVR_HonorUserFSEBehaviorMode" -Type Hex -Value 00000000
    Set-ItemProperty -Path "HKLM:\System\GameConfigStore" -Name "GameDVR_EFSEFeatureFlags" -Type Hex -Value 00000000
    Set-ItemProperty -Path "HKLM:\System\GameConfigStore" -Name "GameDVR_Enabled" -Type DWord -Value 00000000
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" -Name "PowerThrottlingOff" -Type DWord -Value 00000001
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Type DWord -Value 0000000
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" -Name "SearchOrderConfig" -Type DWord -Value 00000000
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Type DWord -Value 0000000a
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Type DWord -Value 0000000a
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "WaitToKillServiceTimeout" -Type DWord -Value 2000
    Set-ItemProperty -Path "HKLM:\Control Panel\Desktop" -Name "MenuShowDelay" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\Control Panel\Desktop" -Name "WaitToKillAppTimeout" -Type DWord -Value 5000
    Set-ItemProperty -Path "HKLM:\Control Panel\Desktop" -Name "HungAppTimeout" -Type DWord -Value 4000
    Set-ItemProperty -Path "HKLM:\Control Panel\Desktop" -Name "AutoEndTasks" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\Control Panel\Desktop" -Name "LowLevelHooksTimeout" -Type DWord -Value 00001000
    Set-ItemProperty -Path "HKLM:\Control Panel\Desktop" -Name "WaitToKillServiceTimeout" -Type DWord -Value 00002000
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "ClearPageFileAtShutdown" -Type DWord -Value 00000001
    Set-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\Ndu" -Name "Start" -Type DWord -Value 00000004
    Set-ItemProperty -Path "HKLM:\Control Panel\Mouse" -Name "MouseHoverTime" -Type DWord -Value 00000010


	# Network Tweaks
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "IRPStackSize" -Type DWord -Value 20

    # Group svchost.exe processes
    $ram = (Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1kb
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Type DWord -Value $ram -Force

    #Write-Host "Installing Windows Media Player..."
	#Enable-WindowsOptionalFeature -Online -FeatureName "WindowsMediaPlayer" -NoRestart -WarningAction SilentlyContinue | Out-Null

    Write-Host "Disable News and Interests"
    $ResultText.text += "`r`n" +"Disabling Extra Junk"
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Name "EnableFeeds" -Type DWord -Value 0
    # Remove "News and Interest" from taskbar
    Set-ItemProperty -Path  "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Type DWord -Value 2

    # remove "Meet Now" button from taskbar

    If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
        New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | Out-Null
    }

Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCAMeetNow" -Type DWord -Value 1

    Write-Host "Removing AutoLogger file and restricting directory..."
    $autoLoggerDir = "$env:PROGRAMDATA\Microsoft\Diagnosis\ETLLogs\AutoLogger"
    If (Test-Path "$autoLoggerDir\AutoLogger-Diagtrack-Listener.etl") {
        Remove-Item "$autoLoggerDir\AutoLogger-Diagtrack-Listener.etl"
    }
    icacls $autoLoggerDir /deny SYSTEM:`(OI`)`(CI`)F | Out-Null

    Write-Host "Stopping and disabling Diagnostics Tracking Service..."
    Stop-Service "DiagTrack"
    Set-Service "DiagTrack" -StartupType Disabled

    Write-Host "Showing known file extensions..."
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Type DWord -Value 0

    # Service tweaks to Manual 

    $services = @(
    "diagnosticshub.standardcollector.service"     # Microsoft (R) Diagnostics Hub Standard Collector Service
    "DiagTrack"                                    # Diagnostics Tracking Service
    "DPS"
    "dmwappushservice"                             # WAP Push Message Routing Service (see known issues)
    "lfsvc"                                        # Geolocation Service
    "MapsBroker"                                   # Downloaded Maps Manager
    "NetTcpPortSharing"                            # Net.Tcp Port Sharing Service
    "RemoteAccess"                                 # Routing and Remote Access
    "RemoteRegistry"                               # Remote Registry
    "SharedAccess"                                 # Internet Connection Sharing (ICS)
    "TrkWks"                                       # Distributed Link Tracking Client
    #"WbioSrvc"                                     # Windows Biometric Service (required for Fingerprint reader / facial detection)
    #"WlanSvc"                                      # WLAN AutoConfig
    "WMPNetworkSvc"                                # Windows Media Player Network Sharing Service
    #"wscsvc"                                       # Windows Security Center Service
    "WSearch"                                      # Windows Search
    "XblAuthManager"                               # Xbox Live Auth Manager
    "XblGameSave"                                  # Xbox Live Game Save Service
    "XboxNetApiSvc"                                # Xbox Live Networking Service
    "XboxGipSvc"                                   #Disables Xbox Accessory Management Service
    "ndu"                                          # Windows Network Data Usage Monitor
    "WerSvc"                                       #disables windows error reporting
    #"Spooler"                                      #Disables your printer
    "Fax"                                          #Disables fax
    "fhsvc"                                        #Disables fax histroy
    "gupdate"                                      #Disables google update
    "gupdatem"                                     #Disable another google update
    "stisvc"                                       #Disables Windows Image Acquisition (WIA)
    "AJRouter"                                     #Disables (needed for AllJoyn Router Service)
    "MSDTC"                                        # Disables Distributed Transaction Coordinator
    "WpcMonSvc"                                    #Disables Parental Controls
    "PhoneSvc"                                     #Disables Phone Service(Manages the telephony state on the device)
    "PrintNotify"                                  #Disables Windows printer notifications and extentions
    "PcaSvc"                                       #Disables Program Compatibility Assistant Service
    "WPDBusEnum"                                   #Disables Portable Device Enumerator Service
    #"LicenseManager"                               #Disable LicenseManager(Windows store may not work properly)
    "seclogon"                                     #Disables  Secondary Logon(disables other credentials only password will work)
    "SysMain"                                      #Disables sysmain
    "lmhosts"                                      #Disables TCP/IP NetBIOS Helper
    "wisvc"                                        #Disables Windows Insider program(Windows Insider will not work)
    "FontCache"                                    #Disables Windows font cache
    "RetailDemo"                                   #Disables RetailDemo whic is often used when showing your device
    "ALG"                                          # Disables Application Layer Gateway Service(Provides support for 3rd party protocol plug-ins for Internet Connection Sharing)
    #"BFE"                                         #Disables Base Filtering Engine (BFE) (is a service that manages firewall and Internet Protocol security)
    #"BrokerInfrastructure"                         #Disables Windows infrastructure service that controls which background tasks can run on the system.
    "SCardSvr"                                      #Disables Windows smart card
    "EntAppSvc"                                     #Disables enterprise application management.
    "BthAvctpSvc"                                   #Disables AVCTP service (if you use  Bluetooth Audio Device or Wireless Headphones. then don't disable this)
    #"FrameServer"                                   #Disables Windows Camera Frame Server(this allows multiple clients to access video frames from camera devices.)
    "Browser"                                       #Disables computer browser
    "BthAvctpSvc"                                   #AVCTP service (This is Audio Video Control Transport Protocol service.)
    #"BDESVC"                                        #Disables bitlocker
    "iphlpsvc"                                      #Disables ipv6 but most websites don't use ipv6 they use ipv4     
    "edgeupdate"                                    # Disables one of edge update service  
    "MicrosoftEdgeElevationService"                 # Disables one of edge  service 
    "edgeupdatem"                                   # disbales another one of update service (disables edgeupdatem)                          
    "SEMgrSvc"                                      #Disables Payments and NFC/SE Manager (Manages payments and Near Field Communication (NFC) based secure elements)
    #"PNRPsvc"                                      # Disables peer Name Resolution Protocol ( some peer-to-peer and collaborative applications, such as Remote Assistance, may not function, Discord will still work)
    #"p2psvc"                                       # Disbales Peer Name Resolution Protocol(nables multi-party communication using Peer-to-Peer Grouping.  If disabled, some applications, such as HomeGroup, may not function. Discord will still work)
    #"p2pimsvc"                                     # Disables Peer Networking Identity Manager (Peer-to-Peer Grouping services may not function, and some applications, such as HomeGroup and Remote Assistance, may not function correctly.Discord will still work)
    "PerfHost"                                      #Disables  remote users and 64-bit processes to query performance .
    "BcastDVRUserService_48486de"                   #Disables GameDVR and Broadcast   is used for Game Recordings and Live Broadcasts
    "CaptureService_48486de"                        #Disables ptional screen capture functionality for applications that call the Windows.Graphics.Capture API.  
    "cbdhsvc_48486de"                               #Disables   cbdhsvc_48486de (clipboard service it disables)
    #"BluetoothUserService_48486de"                  #disbales BluetoothUserService_48486de (The Bluetooth user service supports proper functionality of Bluetooth features relevant to each user session.)
    "WpnService"                                    #Disables WpnService (Push Notifications may not work )
    #"StorSvc"                                       #Disables StorSvc (usb external hard drive will not be reconised by windows)
    "RtkBtManServ"                                  #Disables Realtek Bluetooth Device Manager Service
    "QWAVE"                                         #Disables Quality Windows Audio Video Experience (audio and video might sound worse)
     #Hp services
    "HPAppHelperCap"
    "HPDiagsCap"
    "HPNetworkCap"
    "HPSysInfoCap"
    "HpTouchpointAnalyticsService"
    #hyper-v services
     "HvHost"                          
    "vmickvpexchange"
    "vmicguestinterface"
    "vmicshutdown"
    "vmicheartbeat"
    "vmicvmsession"
    "vmicrdv"
    "vmictimesync" 
    # Services which cannot be disabled
    #"WdNisSvc"
)

foreach ($service in $services) {
    # -ErrorAction SilentlyContinue is so it doesn't write an error to stdout if a service doesn't exist

    Write-Host "Setting $service StartupType to Manual"
    Get-Service -Name $service -ErrorAction SilentlyContinue | Set-Service -StartupType Manual
}

    Write-Host "Essential Tweaks Completed - Please Reboot"
    $ResultText.text = "`r`n" + "Essential Tweaks Done" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$dualboottime.Add_Click({
Write-Host "Setting BIOS time to UTC..."
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" -Name "RealTimeIsUniversal" -Type DWord -Value 1
    $ResultText.text = "`r`n" + "Time set to UTC for consistent time in Dual Boot Systems" + "`r`n" + "`r`n" + "Ready for Next Task"
})

$laptopnumlock.Add_Click({
    Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type DWord -Value 0
    Add-Type -AssemblyName System.Windows.Forms
    If (([System.Windows.Forms.Control]::IsKeyLocked('NumLock'))) {
        $wsh = New-Object -ComObject WScript.Shell
        $wsh.SendKeys('{NUMLOCK}')
    }
})

$essentialundo.Add_Click({
    Write-Host "Creating Restore Point incase something bad happens"
    $ResultText.text = "`r`n" +"`r`n" + "Creating Restore Point and Reverting Settings... Please Wait"
    Enable-ComputerRestore -Drive "C:\"
    Checkpoint-Computer -Description "RestorePoint1" -RestorePointType "MODIFY_SETTINGS"

    Write-Host "Enabling Telemetry..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 1
    Write-Host "Enabling Wi-Fi Sense"
    Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 1
    Write-Host "Enabling Application suggestions..."
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "ContentDeliveryAllowed" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "OemPreInstalledAppsEnabled" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEnabled" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEverEnabled" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SilentInstalledAppsEnabled" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 1
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
        Remove-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Recurse -ErrorAction SilentlyContinue
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Type DWord -Value 0
    Write-Host "Enabling Activity History..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 1
    Write-Host "Enable Location Tracking..."
    If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location")) {
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Recurse -ErrorAction SilentlyContinue
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Type String -Value "Allow"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "SensorPermissionState" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name "Status" -Type DWord -Value 1
    Write-Host "Enabling automatic Maps updates..."
    Set-ItemProperty -Path "HKLM:\SYSTEM\Maps" -Name "AutoUpdateEnabled" -Type DWord -Value 1
    Write-Host "Enabling Feedback..."
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules")) {
        Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Recurse -ErrorAction SilentlyContinue
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "DoNotShowFeedbackNotifications" -Type DWord -Value 0
    Write-Host "Enabling Tailored Experiences..."
    If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
        Remove-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Recurse -ErrorAction SilentlyContinue
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableTailoredExperiencesWithDiagnosticData" -Type DWord -Value 0
    Write-Host "Disabling Advertising ID..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo")) {
        Remove-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Recurse -ErrorAction SilentlyContinue
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Type DWord -Value 0
    Write-Host "Allow Error reporting..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Type DWord -Value 0
    Write-Host "Allowing Diagnostics Tracking Service..."
    Stop-Service "DiagTrack" -WarningAction SilentlyContinue
    Set-Service "DiagTrack" -StartupType Manual
    Write-Host "Allowing WAP Push Service..."
    Stop-Service "dmwappushservice" -WarningAction SilentlyContinue
    Set-Service "dmwappushservice" -StartupType Manual
    Write-Host "Allowing Home Groups services..."
    Stop-Service "HomeGroupListener" -WarningAction SilentlyContinue
    Set-Service "HomeGroupListener" -StartupType Manual
    Stop-Service "HomeGroupProvider" -WarningAction SilentlyContinue
    Set-Service "HomeGroupProvider" -StartupType Manual
    Write-Host "Enabling Storage Sense..."
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" | Out-Null
    Write-Host "Allowing Superfetch service..."
    Stop-Service "SysMain" -WarningAction SilentlyContinue
    Set-Service "SysMain" -StartupType Manual
    Write-Host "Setting BIOS time to Local Time instead of UTC..."
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" -Name "RealTimeIsUniversal" -Type DWord -Value 0
    Write-Host "Enabling Hibernation..."
    Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Power" -Name "HibernteEnabled" -Type Dword -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Name "ShowHibernateOption" -Type Dword -Value 1
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "NoLockScreen" -ErrorAction SilentlyContinue

    Write-Host "Hiding file operations details..."
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager")) {
        Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" -Recurse -ErrorAction SilentlyContinue
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" -Name "EnthusiastMode" -Type DWord -Value 0
    Write-Host "Showing Task View button..."
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 1

    Write-Host "Changing default Explorer view to Quick Access..."
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Type DWord -Value 1

    Write-Host "Unrestricting AutoLogger directory"
    $autoLoggerDir = "$env:PROGRAMDATA\Microsoft\Diagnosis\ETLLogs\AutoLogger"
    icacls $autoLoggerDir /grant:r SYSTEM:`(OI`)`(CI`)F | Out-Null

    Write-Host "Enabling and starting Diagnostics Tracking Service"
    Set-Service "DiagTrack" -StartupType Automatic
    Start-Service "DiagTrack"

    Write-Host "Hiding known file extensions"
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Type DWord -Value 1

    Write-Host "Reset Local Group Policies to Stock Defaults"
    # cmd /c secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose
    cmd /c RD /S /Q "%WinDir%\System32\GroupPolicyUsers"
    cmd /c RD /S /Q "%WinDir%\System32\GroupPolicy"
    cmd /c gpupdate /force
    # Considered using Invoke-GPUpdate but requires module most people won't have installed

    Write-Host "Essential Undo Completed"
    $ResultText.text = "`r`n" +"`r`n" + "Essential Undo Completed - Ready for next task"
})

$windowssearch.Add_Click({
    Write-Host "Disabling Bing Search in Start Menu..."
    $ResultText.text = "`r`n" +"`r`n" + "Disabling Search, Cortana, Start menu search... Please Wait"
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
    <#
    Write-Host "Disabling Cortana"
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -Type DWord -Value 0
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
    }
    #>
    Write-Host "Hiding Search Box / Button..."
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0

    Write-Host "Removing Start Menu Tiles"

    Set-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -Value '<LayoutModificationTemplate xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout" Version="1" xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification">'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '  <LayoutOptions StartTileGroupCellWidth="6" />'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '  <DefaultLayoutOverride>'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '    <StartLayoutCollection>'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '      <defaultlayout:StartLayout GroupCellWidth="6" />'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '    </StartLayoutCollection>'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '  </DefaultLayoutOverride>'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '    <CustomTaskbarLayoutCollection>'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '      <defaultlayout:TaskbarLayout>'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '        <taskbar:TaskbarPinList>'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '          <taskbar:UWA AppUserModelID="Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge" />'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '          <taskbar:DesktopApp DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\System Tools\File Explorer.lnk" />'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '        </taskbar:TaskbarPinList>'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '      </defaultlayout:TaskbarLayout>'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '    </CustomTaskbarLayoutCollection>'
    Add-Content -Path 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml' -value '</LayoutModificationTemplate>'

    $START_MENU_LAYOUT = @"
    <LayoutModificationTemplate xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout" Version="1" xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout" xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification">
        <LayoutOptions StartTileGroupCellWidth="6" />
        <DefaultLayoutOverride>
            <StartLayoutCollection>
                <defaultlayout:StartLayout GroupCellWidth="6" />
            </StartLayoutCollection>
        </DefaultLayoutOverride>
    </LayoutModificationTemplate>
"@

    $layoutFile="C:\Windows\StartMenuLayout.xml"

    #Delete layout file if it already exists
    If(Test-Path $layoutFile)
    {
        Remove-Item $layoutFile
    }

    #Creates the blank layout file
    $START_MENU_LAYOUT | Out-File $layoutFile -Encoding ASCII

    $regAliases = @("HKLM", "HKCU")

    #Assign the start layout and force it to apply with "LockedStartLayout" at both the machine and user level
    foreach ($regAlias in $regAliases){
        $basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
        $keyPath = $basePath + "\Explorer"
        IF(!(Test-Path -Path $keyPath)) {
            New-Item -Path $basePath -Name "Explorer"
        }
        Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 1
        Set-ItemProperty -Path $keyPath -Name "StartLayoutFile" -Value $layoutFile
    }

    #Restart Explorer, open the start menu (necessary to load the new layout), and give it a few seconds to process
    Stop-Process -name explorer
    Start-Sleep -s 5
    $wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('^{ESCAPE}')
    Start-Sleep -s 5

    #Enable the ability to pin items again by disabling "LockedStartLayout"
    foreach ($regAlias in $regAliases){
        $basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
        $keyPath = $basePath + "\Explorer"
        Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 0

    Write-Host "Search and Start Menu Tweaks Complete"
    $ResultText.text = "`r`n" +"`r`n" + "Search and Start Menu Tweaks Complete"
    }
})

$backgroundapps.Add_Click({
    Write-Host "Disabling Background application access..."
    Get-ChildItem -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Exclude "Microsoft.Windows.Cortana*" | ForEach {
        Set-ItemProperty -Path $_.PsPath -Name "Disabled" -Type DWord -Value 1
        Set-ItemProperty -Path $_.PsPath -Name "DisabledByUser" -Type DWord -Value 1
    }
    Write-Host "Disabled Background application access"
    $ResultText.text = "`r`n" +"`r`n" + "Disabled Background application access"
})

$cortana.Add_Click({
    Write-Host "Disabling Cortana..."
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Type DWord -Value 0
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Type DWord -Value 1
    If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Type DWord -Value 0
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Type DWord -Value 0
    Write-Host "Disabled Cortana"
    $ResultText.text = "`r`n" +"`r`n" + "Disabled Cortana"
})

$Bloatware = @(
    #Unnecessary Windows 10 AppX Apps
    "Microsoft.3DBuilder"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.AppConnector"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingTranslator"
    "Microsoft.BingWeather"
    "Microsoft.BingFoodAndDrink"
    "Microsoft.BingHealthAndFitness"
    "Microsoft.BingTravel"
    "Microsoft.MinecraftUWP"
    "Microsoft.GamingServices"
    # "Microsoft.WindowsReadingList"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.News"
    "Microsoft.Office.Lens"
    "Microsoft.Office.Sway"
    "Microsoft.Office.OneNote"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.Print3D"
    "Microsoft.SkypeApp"
    "Microsoft.Wallet"
    "Microsoft.Whiteboard"
    "Microsoft.WindowsAlarms"
    "microsoft.windowscommunicationsapps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsPhone"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.XboxApp"
    "Microsoft.ConnectivityStore"
    "Microsoft.CommsPhone"
    "Microsoft.ScreenSketch"
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGameCallableUI"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.MixedReality.Portal"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Microsoft.YourPhone"
    "Microsoft.Getstarted"
    "Microsoft.MicrosoftOfficeHub"

    #Sponsored Windows 10 AppX Apps
    #Add sponsored/featured apps to remove in the "*AppName*" format
    "*EclipseManager*"
    "*ActiproSoftwareLLC*"
    "*AdobeSystemsIncorporated.AdobePhotoshopExpress*"
    "*Duolingo-LearnLanguagesforFree*"
    "*PandoraMediaInc*"
    "*CandyCrush*"
    "*BubbleWitch3Saga*"
    "*Wunderlist*"
    "*Flipboard*"
    "*Twitter*"
    "*Facebook*"
    "*Royal Revolt*"
    "*Sway*"
    "*Speed Test*"
    "*Dolby*"
    "*Viber*"
    "*ACGMediaPlayer*"
    "*Netflix*"
    "*OneCalendar*"
    "*LinkedInforWindows*"
    "*HiddenCityMysteryofShadows*"
    "*Hulu*"
    "*HiddenCity*"
    "*AdobePhotoshopExpress*"
    "*HotspotShieldFreeVPN*"

    #Optional: Typically not removed but you can if you need to for some reason
    "*Microsoft.Advertising.Xaml*"
    #"*Microsoft.MSPaint*"
    #"*Microsoft.MicrosoftStickyNotes*"
    #"*Microsoft.Windows.Photos*"
    #"*Microsoft.WindowsCalculator*"
    #"*Microsoft.WindowsStore*"
)

$removebloat.Add_Click({
    Write-Host "Removing Bloatware"

    foreach ($Bloat in $Bloatware) {
        Get-AppxPackage -Name $Bloat| Remove-AppxPackage
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
        Write-Host "Trying to remove $Bloat."
        $ResultText.text = "`r`n" +"`r`n" + "Trying to remove $Bloat."
    }

    Write-Host "Finished Removing Bloatware Apps"
    $ResultText.text = "`r`n" +"`r`n" + "Finished Removing Bloatware Apps"
})

$reinstallbloat.Add_Click({
    Write-Host "Reinstalling Bloatware"

    foreach ($app in $Bloatware) {
        Write-Output "Trying to add $app"
        $ResultText.text = "`r`n" +"`r`n" + "Trying to add $app"
        Add-AppxPackage -DisableDevelopmentMode -Register "$($(Get-AppxPackage -AllUsers $app).InstallLocation)\AppXManifest.xml"
    }

    Write-Host "Finished Reinstalling Bloatware Apps"
    $ResultText.text = "`r`n" +"`r`n" + "Finished Reinstalling Bloatware Apps"
})

$defaultwindowsupdate.Add_Click({
    Write-Host "Enabling driver offering through Windows Update..."
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontPromptForWindowsUpdate" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontSearchWindowsUpdate" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DriverUpdateWizardWuSearchEnabled" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "ExcludeWUDriversInQualityUpdate" -ErrorAction SilentlyContinue
    Write-Host "Enabling Windows Update automatic restart..."
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoRebootWithLoggedOnUsers" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUPowerManagement" -ErrorAction SilentlyContinue
    Write-Host "Enabled driver offering through Windows Update"
    $ResultText.text = "`r`n" +"`r`n" + "Set Windows Updates to Stock Settings"
})

$securitywindowsupdate.Add_Click({
    Write-Host "Disabling driver offering through Windows Update..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -Type DWord -Value 1
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontPromptForWindowsUpdate" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontSearchWindowsUpdate" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DriverUpdateWizardWuSearchEnabled" -Type DWord -Value 0
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "ExcludeWUDriversInQualityUpdate" -Type DWord -Value 1
    Write-Host "Disabling Windows Update automatic restart..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoRebootWithLoggedOnUsers" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUPowerManagement" -Type DWord -Value 0
    Write-Host "Disabled driver offering through Windows Update"
    $ResultText.text = "`r`n" +"`r`n" + "Set Windows Update to Sane Settings"
})

$actioncenter.Add_Click({
    Write-Host "Disabling Action Center..."
    If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer")) {
        New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Type DWord -Value 0
    Write-Host "Disabled Action Center"
    $ResultText.text = "`r`n" +"`r`n" + "Disabled Action Center"
})

$performancefx.Add_Click({
    Write-Host "Adjusting visual effects for performance..."
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Type String -Value 0
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Type String -Value 200
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Type Binary -Value ([byte[]](144,18,3,128,16,0,0,0))
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Type String -Value 0
    Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Type DWord -Value 3
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "EnableAeroPeek" -Type DWord -Value 0
    Write-Host "Adjusted visual effects for performance"
    $ResultText.text = "`r`n" +"`r`n" + "Adjusted VFX for performance"
})

$appearancefx.Add_Click({
	Write-Output "Adjusting visual effects for appearance..."
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Type String -Value 1
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Type String -Value 400
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Type Binary -Value ([byte[]](158,30,7,128,18,0,0,0))
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Type String -Value 1
	Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Type DWord -Value 3
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "EnableAeroPeek" -Type DWord -Value 1
    $ResultText.text = "`r`n" +"`r`n" + "Visual effects are set for appearance (Defaults)"
})

$onedrive.Add_Click({
    Write-Host "Disabling OneDrive..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -Type DWord -Value 1
    Write-Host "Uninstalling OneDrive..."
    Stop-Process -Name "OneDrive" -ErrorAction SilentlyContinue
    Start-Sleep -s 2
    $onedrive = "$env:SYSTEMROOT\SysWOW64\OneDriveSetup.exe"
    If (!(Test-Path $onedrive)) {
        $onedrive = "$env:SYSTEMROOT\System32\OneDriveSetup.exe"
    }
    Start-Process $onedrive "/uninstall" -NoNewWindow -Wait
    Start-Sleep -s 2
    Stop-Process -Name "explorer" -ErrorAction SilentlyContinue
    Start-Sleep -s 2
    Remove-Item -Path "$env:USERPROFILE\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:PROGRAMDATA\Microsoft OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:SYSTEMDRIVE\OneDriveTemp" -Force -Recurse -ErrorAction SilentlyContinue
    If (!(Test-Path "HKCR:")) {
        New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
    }
    Remove-Item -Path "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue
    Write-Host "Disabled OneDrive"
    $ResultText.text = "`r`n" +"`r`n" + "Deleted and Disabled OneDrive"
})

$darkmode.Add_Click({
    Write-Host "Enabling Dark Mode"
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0
    Write-Host "Enabled Dark Mode"
    $ResultText.text = "`r`n" +"`r`n" + "Enabled Dark Mode"
})

$lightmode.Add_Click({
    Write-Host "Switching Back to Light Mode"
    Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme
    Write-Host "Switched Back to Light Mode"
    $ResultText.text = "`r`n" +"`r`n" + "Enabled Light Mode"
})

$EActionCenter.Add_Click({
    Write-Host "Enabling Action Center..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -ErrorAction SilentlyContinue
	Write-Host "Done - Reverted to Stock Settings"
    $ResultText.text = "`r`n" +"`r`n" + "Enabled Action Center"
})

$ECortana.Add_Click({
    Write-Host "Enabling Cortana..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -ErrorAction SilentlyContinue
	If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore")) {
		New-Item -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Type DWord -Value 0
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -ErrorAction SilentlyContinue
	Write-Host "Restoring Windows Search..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value "1"
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -ErrorAction SilentlyContinue
	Write-Host "Restore and Starting Windows Search Service..."
    Set-Service "WSearch" -StartupType Automatic
    Start-Service "WSearch" -WarningAction SilentlyContinue
    Write-Host "Restore Windows Search Icon..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 1
	Write-Host "Done - Reverted to Stock Settings"
    $ResultText.text = "`r`n" +"`r`n" + "Enabled Cortana and Restored Search"
})

$HTrayIcons.Add_Click({

	Write-Host "Hiding tray icons..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableAutoTray" -Type DWord -Value 1
	Write-Host "Done - Hid Tray Icons"
    $ResultText.text = "`r`n" +"`r`n" + "Tray icons are now factory defaults"
})


$STrayIcons.Add_Click({

	Write-Host "Showing tray icons..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableAutoTray" -Type DWord -Value 0
	Write-Host "Done - Now showing all tray icons"
    $ResultText.text = "`r`n" +"`r`n" + "Tray Icons now set to show all"
})

$EClipboardHistory.Add_Click({
	Write-Host "Restoring Clipboard History..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Clipboard" -Name "EnableClipboardHistory" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "AllowClipboardHistory" -ErrorAction SilentlyContinue
	Write-Host "Done - Reverted to Stock Settings"
    $ResultText.text = "`r`n" +"`r`n" + "Enabled Clipboard History"
})

$ELocation.Add_Click({
	Write-Host "Enabling Location Provider..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableWindowsLocationProvider" -ErrorAction SilentlyContinue
	Write-Host "Enabling Location Scripting..."
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableLocationScripting" -ErrorAction SilentlyContinue
	Write-Host "Enabling Location..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableLocation" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "SensorPermissionState" -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "Value" -Type String -Value "Allow"
	Write-Host "Allow access to Location..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Type String -Value "Allow"
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name "Status" -Type DWord -Value "1"
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessLocation" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessLocation_UserInControlOfTheseApps" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessLocation_ForceAllowTheseApps" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessLocation_ForceDenyTheseApps" -ErrorAction SilentlyContinue
	Write-Host "Done - Reverted to Stock Settings"
    $ResultText.text = "`r`n" +"`r`n" + "Location Tracking now on... Reboot to check."
})

$RBackgroundApps.Add_Click({
	Write-Host "Allowing Background Apps..."
	Get-ChildItem -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Exclude "Microsoft.Windows.Cortana*" | ForEach {
		Remove-ItemProperty -Path $_.PsPath -Name "Disabled" -ErrorAction SilentlyContinue
		Remove-ItemProperty -Path $_.PsPath -Name "DisabledByUser" -ErrorAction SilentlyContinue
	}
	Write-Host "Done - Reverted to Stock Settings"
    $ResultText.text = "`r`n" +"`r`n" + "Enabled Background Apps"
})

$EHibernation.Add_Click({
    Write-Host "Enabling Hibernation"
    Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Power" -Name "HibernteEnabled" -Type Dword -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Name "ShowHibernateOption" -Type Dword -Value 1
    Write-Host "Done - Reverted to Stock Settings"
    $ResultText.text = "`r`n" +"`r`n" + "Enabled Hibernation"
})

$InstallOneDrive.Add_Click({
    Write-Host "Installing Onedrive. Please Wait..."
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -ErrorAction SilentlyContinue
    %systemroot%\SysWOW64\OneDriveSetup.exe
    $ResultText.text = "`r`n" +"`r`n" + "Finished Reinstalling OneDrive"
})

$DisableNumLock.Add_Click({
    Write-Host "Disable NumLock after startup..."
    Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type DWord -Value 0
    Add-Type -AssemblyName System.Windows.Forms
    If (([System.Windows.Forms.Control]::IsKeyLocked('NumLock'))) {
        $wsh = New-Object -ComObject WScript.Shell
        $wsh.SendKeys('{NUMLOCK}')
    }
    $ResultText.text = "`r`n" +"`r`n" + "NUMLOCK Disabled"
})

$yourphonefix.Add_Click({
    Write-Host "Reinstalling Your Phone App"
    Add-AppxPackage -DisableDevelopmentMode -Register "$($(Get-AppXPackage -AllUsers "Microsoft.YourPhone").InstallLocation)\AppXManifest.xml"
    Write-Host "Enable needed data collection for Your Phone..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableMmx" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableCdp" -Type DWord -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging" -Name "AllowMessageSync" -Type DWord -Value 1
    Write-Host "Allowing Background Apps..."
	Get-ChildItem -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Exclude "Microsoft.Windows.Cortana*" | ForEach {
		Remove-ItemProperty -Path $_.PsPath -Name "Disabled" -ErrorAction SilentlyContinue
		Remove-ItemProperty -Path $_.PsPath -Name "DisabledByUser" -ErrorAction SilentlyContinue
	}
    Write-Host "You may need to Reboot and right-click Your Phone app and select repair"
    $ResultText.text = "`r`n" +"`r`n" + "You may need to Reboot and right-click Your Phone app and select repair"
})

$ncpa.Add_Click({
    cmd /c ncpa.cpl
})
$oldsoundpanel.Add_Click({
    cmd /c mmsys.cpl
})
$oldcontrolpanel.Add_Click({
    cmd /c control
})
$oldsystempanel.Add_Click({
    cmd /c sysdm.cpl
})
$oldpower.Add_Click({
    cmd /c powercfg.cpl
})
$restorepower.Add_Click({
    powercfg -duplicatescheme a1841308-3541-4fab-bc81-f71556f20b4a
    powercfg -duplicatescheme 381b4222-f694-41f0-9685-ff5bb260df2e
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
    Write-Host "Restored all power plans: Balanced, High Performance, and Power Saver"
    $ResultText.text = "`r`n" +"`r`n" + "Restored all power plans: Balanced, High Performance, and Power Saver"
})
$NFS.Add_Click({
    Enable-WindowsOptionalFeature -Online -FeatureName "ServicesForNFS-ClientOnly" -All
    Enable-WindowsOptionalFeature -Online -FeatureName "ClientForNFS-Infrastructure" -All
    Enable-WindowsOptionalFeature -Online -FeatureName "NFS-Administration" -All
    nfsadmin client stop
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\ClientForNFS\CurrentVersion\Default" -Name "AnonymousUID" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\ClientForNFS\CurrentVersion\Default" -Name "AnonymousGID" -Type DWord -Value 0
    nfsadmin client start
    nfsadmin client localhost config fileaccess=755 SecFlavors=+sys -krb5 -krb5i
    Write-Host "NFS is now setup for user based NFS mounts"
    $ResultText.text = "`r`n" +"`r`n" + "NFS is now setup for user based NFS mounts"
})

$Virtualization.Add_Click({
    Enable-WindowsOptionalFeature -Online -FeatureName "HypervisorPlatform" -All
    Enable-WindowsOptionalFeature -Online -FeatureName "VirtualMachinePlatform" -All
    Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Windows-Subsystem-Linux" -All
    Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V-All" -All
    Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V" -All
    Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V-Tools-All" -All
    Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V-Management-PowerShell" -All
    Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V-Hypervisor" -All
    Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V-Services" -All
    Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V-Management-Clients" -All
    cmd /c bcdedit /set hypervisorschedulertype classic
    Write-Host "HyperV is now installed and configured. Please Reboot before using."
    $ResultText.text = "`r`n" +"`r`n" + "HyperV is now installed and configured. Please Reboot before using."
})

$windowsupdatefix.Add_Click({
    Write-Host "1. Stopping Windows Update Services..." 
    Stop-Service -Name BITS 
    Stop-Service -Name wuauserv 
    Stop-Service -Name appidsvc 
    Stop-Service -Name cryptsvc 
    
    Write-Host "2. Remove QMGR Data file..." 
    Remove-Item "$env:allusersprofile\Application Data\Microsoft\Network\Downloader\qmgr*.dat" -ErrorAction SilentlyContinue 
    
    Write-Host "3. Renaming the Software Distribution and CatRoot Folder..." 
    Rename-Item $env:systemroot\SoftwareDistribution SoftwareDistribution.bak -ErrorAction SilentlyContinue 
    Rename-Item $env:systemroot\System32\Catroot2 catroot2.bak -ErrorAction SilentlyContinue 
    
    Write-Host "4. Removing old Windows Update log..." 
    Remove-Item $env:systemroot\WindowsUpdate.log -ErrorAction SilentlyContinue 
    
    Write-Host "5. Resetting the Windows Update Services to defualt settings..." 
    "sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)" 
    "sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)" 
    
    Set-Location $env:systemroot\system32 
    
    Write-Host "6. Registering some DLLs..." 
    regsvr32.exe /s atl.dll 
    regsvr32.exe /s urlmon.dll 
    regsvr32.exe /s mshtml.dll 
    regsvr32.exe /s shdocvw.dll 
    regsvr32.exe /s browseui.dll 
    regsvr32.exe /s jscript.dll 
    regsvr32.exe /s vbscript.dll 
    regsvr32.exe /s scrrun.dll 
    regsvr32.exe /s msxml.dll 
    regsvr32.exe /s msxml3.dll 
    regsvr32.exe /s msxml6.dll 
    regsvr32.exe /s actxprxy.dll 
    regsvr32.exe /s softpub.dll 
    regsvr32.exe /s wintrust.dll 
    regsvr32.exe /s dssenh.dll 
    regsvr32.exe /s rsaenh.dll 
    regsvr32.exe /s gpkcsp.dll 
    regsvr32.exe /s sccbase.dll 
    regsvr32.exe /s slbcsp.dll 
    regsvr32.exe /s cryptdlg.dll 
    regsvr32.exe /s oleaut32.dll 
    regsvr32.exe /s ole32.dll 
    regsvr32.exe /s shell32.dll 
    regsvr32.exe /s initpki.dll 
    regsvr32.exe /s wuapi.dll 
    regsvr32.exe /s wuaueng.dll 
    regsvr32.exe /s wuaueng1.dll 
    regsvr32.exe /s wucltui.dll 
    regsvr32.exe /s wups.dll 
    regsvr32.exe /s wups2.dll 
    regsvr32.exe /s wuweb.dll 
    regsvr32.exe /s qmgr.dll 
    regsvr32.exe /s qmgrprxy.dll 
    regsvr32.exe /s wucltux.dll 
    regsvr32.exe /s muweb.dll 
    regsvr32.exe /s wuwebv.dll 
    
    Write-Host "7) Removing WSUS client settings..." 
    REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v AccountDomainSid /f 
    REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v PingID /f 
    REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f 
    
    Write-Host "8) Resetting the WinSock..." 
    netsh winsock reset 
    netsh winhttp reset proxy 
    
    Write-Host "9) Delete all BITS jobs..." 
    Get-BitsTransfer | Remove-BitsTransfer 
    
    Write-Host "10) Attempting to install the Windows Update Agent..." 
    if($arch -eq 64){ 
        wusa Windows8-RT-KB2937636-x64 /quiet 
    } 
    else{ 
        wusa Windows8-RT-KB2937636-x86 /quiet 
    } 
    
    Write-Host "11) Starting Windows Update Services..." 
    Start-Service -Name BITS 
    Start-Service -Name wuauserv 
    Start-Service -Name appidsvc 
    Start-Service -Name cryptsvc 
    
    Write-Host "12) Forcing discovery..." 
    wuauclt /resetauthorization /detectnow 
    
    Write-Host "Process complete. Please reboot your computer."
    $ResultText.text = "`r`n" +"`r`n" + "Process complete. Please reboot your computer."

})

$disableupdates.Add_Click({

    # Source: https://github.com/rgl/windows-vagrant/blob/master/disable-windows-updates.ps1
    Set-StrictMode -Version Latest
$ProgressPreference = 'SilentlyContinue'
$ErrorActionPreference = 'Stop'
trap {
    Write-Host
    Write-Host "ERROR: $_"
    Write-Host (($_.ScriptStackTrace -split '\r?\n') -replace '^(.*)$','ERROR: $1')
    Write-Host (($_.Exception.ToString() -split '\r?\n') -replace '^(.*)$','ERROR EXCEPTION: $1')
    Write-Host
    Write-Host 'Sleeping for 60m to give you time to look around the virtual machine before self-destruction...'
    Start-Sleep -Seconds (60*60)
    Exit 1
}

# disable automatic updates.
# XXX this does not seem to work anymore.
# see How to configure automatic updates by using Group Policy or registry settings
#     at https://support.microsoft.com/en-us/help/328010
function New-Directory($path) {
    $p, $components = $path -split '[\\/]'
    $components | ForEach-Object {
        $p = "$p\$_"
        if (!(Test-Path $p)) {
            New-Item -ItemType Directory $p | Out-Null
        }
    }
    $null
}
$auPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU'
New-Directory $auPath 
# set NoAutoUpdate.
# 0: Automatic Updates is enabled (default).
# 1: Automatic Updates is disabled.
New-ItemProperty `
    -Path $auPath `
    -Name NoAutoUpdate `
    -Value 1 `
    -PropertyType DWORD `
    -Force `
    | Out-Null
# set AUOptions.
# 1: Keep my computer up to date has been disabled in Automatic Updates.
# 2: Notify of download and installation.
# 3: Automatically download and notify of installation.
# 4: Automatically download and scheduled installation.
New-ItemProperty `
    -Path $auPath `
    -Name AUOptions `
    -Value 1 `
    -PropertyType DWORD `
    -Force `
    | Out-Null

# disable Windows Update Delivery Optimization.
# NB this applies to Windows 10.
# 0: Disabled
# 1: PCs on my local network
# 3: PCs on my local network, and PCs on the Internet
$deliveryOptimizationPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config'
if (Test-Path $deliveryOptimizationPath) {
    New-ItemProperty `
        -Path $deliveryOptimizationPath `
        -Name DODownloadMode `
        -Value 0 `
        -PropertyType DWORD `
        -Force `
        | Out-Null
}
# Service tweaks for Windows Update

$services = @(
    "BITS"
    "wuauserv"
)

foreach ($service in $services) {
    # -ErrorAction SilentlyContinue is so it doesn't write an error to stdout if a service doesn't exist

    Write-Host "Setting $service StartupType to Disabled"
    Get-Service -Name $service -ErrorAction SilentlyContinue | Set-Service -StartupType Disabled
}
})

$enableupdates.Add_Click({

    # Source: https://github.com/rgl/windows-vagrant/blob/master/disable-windows-updates.ps1
    Set-StrictMode -Version Latest
$ProgressPreference = 'SilentlyContinue'
$ErrorActionPreference = 'Stop'
trap {
    Write-Host
    Write-Host "ERROR: $_"
    Write-Host (($_.ScriptStackTrace -split '\r?\n') -replace '^(.*)$','ERROR: $1')
    Write-Host (($_.Exception.ToString() -split '\r?\n') -replace '^(.*)$','ERROR EXCEPTION: $1')
    Write-Host
    Write-Host 'Sleeping for 60m to give you time to look around the virtual machine before self-destruction...'
    Start-Sleep -Seconds (60*60)
    Exit 1
}

# disable automatic updates.
# XXX this does not seem to work anymore.
# see How to configure automatic updates by using Group Policy or registry settings
#     at https://support.microsoft.com/en-us/help/328010
function New-Directory($path) {
    $p, $components = $path -split '[\\/]'
    $components | ForEach-Object {
        $p = "$p\$_"
        if (!(Test-Path $p)) {
            New-Item -ItemType Directory $p | Out-Null
        }
    }
    $null
}
$auPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU'
New-Directory $auPath 
# set NoAutoUpdate.
# 0: Automatic Updates is enabled (default).
# 1: Automatic Updates is disabled.
New-ItemProperty `
    -Path $auPath `
    -Name NoAutoUpdate `
    -Value 0 `
    -PropertyType DWORD `
    -Force `
    | Out-Null
# set AUOptions.
# 1: Keep my computer up to date has been disabled in Automatic Updates.
# 2: Notify of download and installation.
# 3: Automatically download and notify of installation.
# 4: Automatically download and scheduled installation.
New-ItemProperty `
    -Path $auPath `
    -Name AUOptions `
    -Value 3 `
    -PropertyType DWORD `
    -Force `
    | Out-Null

# disable Windows Update Delivery Optimization.
# NB this applies to Windows 10.
# 0: Disabled
# 1: PCs on my local network
# 3: PCs on my local network, and PCs on the Internet
$deliveryOptimizationPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config'
if (Test-Path $deliveryOptimizationPath) {
    New-ItemProperty `
        -Path $deliveryOptimizationPath `
        -Name DODownloadMode `
        -Value 0 `
        -PropertyType DWORD `
        -Force `
        | Out-Null
}
# Service tweaks for Windows Update

$services = @(
    "BITS"
    "wuauserv"
)

foreach ($service in $services) {
    # -ErrorAction SilentlyContinue is so it doesn't write an error to stdout if a service doesn't exist

    Write-Host "Setting $service StartupType to Automatic"
    Get-Service -Name $service -ErrorAction SilentlyContinue | Set-Service -StartupType Automatic
}
})

[void]$Form.ShowDialog()

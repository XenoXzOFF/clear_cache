# Clear_Cache.ps1

Write-Host "Que voulez-vous supprimer ?"
Write-Host "1) Caches Windows uniquement"
Write-Host "2) Caches FiveM uniquement"
Write-Host "3) Les deux"
$choix = Read-Host "Entrez votre choix (1/2/3)"

# Chemins des caches FiveM
$fivemPaths = @(
    "$env:USERPROFILE\AppData\Local\FiveM\FiveM.app\logs",
    "$env:USERPROFILE\AppData\Local\FiveM\FiveM.app\crashes",
    "$env:USERPROFILE\AppData\Local\FiveM\FiveM.app\data\cache",
    "$env:USERPROFILE\AppData\Local\FiveM\FiveM.app\data\nui-storage",
    "$env:USERPROFILE\AppData\Local\FiveM\FiveM.app\data\server-cache",
    "$env:USERPROFILE\AppData\Local\FiveM\FiveM.app\data\server-cache-priv"
)

# Chemins des caches Windows
$windowsPaths = @(
    "C:\Windows\Prefetch",
    "C:\Windows\Temp",
    "$env:USERPROFILE\AppData\Local\Temp"
)

function Remove-Files($paths) {
    foreach ($p in $paths) {
        if (Test-Path $p) {
            Write-Host "Suppression de $p"
            Remove-Item "$p\*" -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
}

switch ($choix) {
    "1" { Remove-Files $windowsPaths }
    "2" { Remove-Files $fivemPaths }
    "3" { Remove-Files $fivemPaths; Remove-Files $windowsPaths }
    default { Write-Host "Choix invalide" }
}

Write-Host "Terminé !"

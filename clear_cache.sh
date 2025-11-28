#!/bin/bash

echo "Que voulez-vous supprimer ?"
echo "1) Caches Windows uniquement"
echo "2) Caches FiveM uniquement"
echo "3) Les deux"
read -p "Entrez votre choix (1/2/3) : " choix

# Chemins des caches FiveM
FIVEM_LOGS="$HOME/AppData/Local/FiveM/FiveM.app/logs"
FIVEM_CRASHES="$HOME/AppData/Local/FiveM/FiveM.app/crashes"
FIVEM_CACHE="$HOME/AppData/Local/FiveM/FiveM.app/data/cache"
FIVEM_NUI="$HOME/AppData/Local/FiveM/FiveM.app/data/nui-storage"
FIVEM_SERVER="$HOME/AppData/Local/FiveM/FiveM.app/data/server-cache"
FIVEM_SERVER_PRIV="$HOME/AppData/Local/FiveM/FiveM.app/data/server-cache-priv"

# Chemins des caches Windows
WIN_PREFETCH="/mnt/c/Windows/Prefetch"
WIN_TEMP="/mnt/c/Windows/Temp"
USER_TEMP="$HOME/AppData/Local/Temp"

delete_fivem() {
    echo "Suppression des caches FiveM..."
    rm -rf "$FIVEM_LOGS"/* "$FIVEM_CRASHES"/* "$FIVEM_CACHE"/* "$FIVEM_NUI"/* "$FIVEM_SERVER"/* "$FIVEM_SERVER_PRIV"/*
    echo "Caches FiveM supprimés."
}

delete_windows() {
    echo "Suppression des caches Windows..."
    rm -rf "$WIN_PREFETCH"/* "$WIN_TEMP"/* "$USER_TEMP"/*
    echo "Caches Windows supprimés."
}

case "$choix" in
    1)
        delete_windows
        ;;
    2)
        delete_fivem
        ;;
    3)
        delete_fivem
        delete_windows
        ;;
    *)
        echo "Choix invalide."
        ;;
esac

echo "Terminé !"

#!/bin/bash

DATE=$(date "+%Y-%m-%d %H:%M:%S")
SOURCE="/home/soporte/n8n_data"
DEST_LOCAL="/home/soporte/n8n_backup.tar.gz"
DEST_REMOTE="/mnt/n8n_backup/n8n_backup.tar.gz"
LOG="/home/soporte/backup_n8n.log"

# Crear backup local
if tar -czf "$DEST_LOCAL" -C "$SOURCE" .; then
    echo "[$DATE] ✅ Backup local creado correctamente." >> "$LOG"
else
    echo "[$DATE] ❌ Error al crear el backup local." >> "$LOG"
    exit 1
fi

# Copiar al servidor remoto
if cp -f "$DEST_LOCAL" "$DEST_REMOTE"; then
    echo "[$DATE] ✅ Backup copiado exitosamente a $DEST_REMOTE" >> "$LOG"
else
    echo "[$DATE] ❌ Error al copiar el backup al servidor remoto." >> "$LOG"
fi

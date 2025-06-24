# 🛡️ Respaldo Automático de n8n con Backup Local y Remoto

Este repositorio documenta una solución **real y funcional** para respaldar automáticamente todos los flujos, configuraciones y credenciales de [n8n](https://n8n.io/) utilizando `cron`, `bash`, `mount CIFS` y `tar.gz`, con copia local y remota a un servidor Windows compartido.

📅 Fecha de implementación: **24-06-2025**

---

## 📦 ¿Qué respalda esta solución?

El sistema guarda **todo el contenido de trabajo de n8n**, incluyendo:

- Flujos creados en la interfaz (workflow_entity)
- Credenciales API
- Archivos adjuntos (binaryData)
- Logs de ejecución
- Base de datos SQLite (`config`)
- Todo comprimido como `n8n_backup.tar.gz`

---

## 🛠️ Componentes utilizados

| Componente             | Función                                                       |
|------------------------|---------------------------------------------------------------|
| `cron`                 | Programa el backup automático cada 2 minutos                  |
| `backup_n8n.sh`        | Script principal de respaldo y copia remota                   |
| `/mnt/n8n_backup`      | Carpeta montada a un recurso CIFS en Windows Server           |
| `/etc/fstab`           | Montaje automático al reiniciar                               |
| `.cred`                | Archivo seguro con las credenciales CIFS                      |
| `tar`                  | Comprime el directorio `n8n_data`                             |

---

## 🧪 Estructura del backup generado

```bash
n8n_backup.tar.gz
├── binaryData/
├── nodes/
├── config               # Contiene workflows y credenciales (SQLite)
├── crash.journal
└── n8nEventLog.log
```

---

## 🔄 Restauración

Para restaurar completamente tu instancia de n8n:

1. Instalar la misma versión de n8n
2. Detener el contenedor o servicio
3. Extraer el contenido del backup:

```bash
tar -xzf n8n_backup.tar.gz -C /home/node/.n8n
```

4. Iniciar nuevamente el servicio

---

## 📂 Estructura del proyecto

```bash
n8n-backup-automation/
├── backup_n8n.sh              # Script automatizado de respaldo
├── crontab.txt                # Entrada de cron usada
├── fstab_example              # Montaje CIFS documentado
├── credentials_example.txt    # Ejemplo de archivo .cred seguro
└── README.md
```

---

## 👨‍💻 Autor y propósito

Desarrollado por **Kristian Gutiérrez**, Administrador de Infraestructura TI, como parte de su entorno real de respaldo para flujos críticos de automatización empresarial con n8n.

Este repositorio puede servirte como:

- Base para tu propia estrategia de respaldo de flujos n8n
- Demostración profesional para tu portafolio
- Proyecto real para compartir en LinkedIn

---

¿Te gustaría que agreguemos integración con alertas por email, Telegram o monitoreo automático de fallos?

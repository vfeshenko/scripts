Репозитоий для скриптов на bash

Описание:

backup.sh - скрипт для создания бэкапа из гипервизора proxmox. (backup <vmid> <options>)
backup-exist.sh - скрипт для проверки наличия бэкапов для определенной ВМ гипервизора proxmox (backup-exist <vmid>)
restore.sh - скрипт для восстановления бэкапа из гипервизора proxmox (restore <vmid> <options>)

В данной версии скрипты выполняют бэкап и восстановление с остановкой ВМ (без снапшотов) и предназначены для создания эталонных бэкапов.

Установка

git clone https://github.com/vfeshenko/scripts.git
cd scripts
make install



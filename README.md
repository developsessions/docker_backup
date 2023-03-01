# Docker volume backup and restore

This script backups and restores docker volumes.
We should stop all running container which are using the volumes to backup / restore.

## Usage

### Backup

```bash
chmod +x volume_backup.sh
sudo ./volume_backup.sh "<volume name 1> <volume name 2>"
```

### Restore

```bash
chmod +x volume_backup.sh
sudo ./volume_backup.sh --restore <backup .tar.gz filename>
```

---

<a href="https://www.buymeacoffee.com/developsessions" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-1.svg" alt="Buy Me A Coffee" height="41" width="174"></a>

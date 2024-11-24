# Automate regular backups with rsync
#!/bin/bash
echo "Starting backup..."
rsync -av ~/SingularityEngine /SingularityBackups/
echo "Backup completed!"

# Make the backup script executable
chmod +x ~/SingularityEngine/backup_script.sh

# Schedule the backup script with cron
crontab -e
# Add:
0 2 * * 0 ~/SingularityEngine/backup_script.sh

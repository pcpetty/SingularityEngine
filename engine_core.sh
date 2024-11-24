#!/bin/bash
exec > >(tee -i ~/SingularityEngine/singularity_log.txt)
exec 2>&1
echo "Activating the Singularity Engine..."
echo "Step 1: System Update and Cleanup"
sudo pacman -Syu --noconfirm
sudo pacman -Rns $(pacman -Qdtq) --noconfirm
#
echo "Step 2: Verify Disk and Resource Status"
df -h
free -h
glances --stdout
#
# echo "Step 3: Backup Critical Files"
rsync -av ~/Documents ~/SingularityBackups/
#
echo "Step 4: Check System Security"
sudo ufw status
sudo aide --check
#
echo "Singularity Engine Activation Complete!"

# Make the script executable
chmod +x engine_core.sh

# Test the script
# ./engine_core.sh

#!/bin/sh
date +'FORMAT'
 
### mm/dd/yyyy ###
date +'%m/%d/%Y'
 
## Time in 12 hr format ###
date +'%r'
 
## backup dir format ##
backup_dir=$(date +'%m-%d-%Y')
echo "Backup dir for today: /var/www/html/Camera/${backup_dir}"

rsync -av -e 'ssh -i ~/.ssh/camera-key.pem' /var/www/html/media/* ubuntu@ec2-18-217-65-68.us-east-2.compute.amazonaws.com:/var/www/html/Camera/${backup_dir}/

sudo rm -f /var/www/html/media/*

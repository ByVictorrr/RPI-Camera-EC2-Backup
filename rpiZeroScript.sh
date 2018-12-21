#!/bin/sh
date +'FORMAT'
 
### mm/dd/yyyy ###
date +'%m/%d/%Y'
 
## Time in 12 hr format ###
date +'%r'
 
## backup dir format ##
backup_dir=$(date +'%m-%d-%Y')
echo "Backup dir for today: /var/www/html/Camera/${backup_dir}"

rsync -av -e 'ssh -i ~/.ssh/camera-key.pem' /var/www/html/media/* ec2-user@public_dns_name:/var/www/html/Camera/${backup_dir}/

sudo rm -f /var/www/html/media/*

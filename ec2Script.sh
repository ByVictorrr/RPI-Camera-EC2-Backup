#!/bin/bash
date + 'FORMAT'

### mm/dd/yyyy ###
date +'%m-%d-%Y'

## Time in 12 hr format ###
date +'%r'

## backup dir format ##
backup_dir=$(date +'%m-%d-%Y')
echo "Backup dir for today: /var/www/html/Camera/${backup_dir}"

sudo mkdir /var/www/html/Camera/${backup_dir}

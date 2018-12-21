# RPI Camera EC2 BACKUP

This project is essentially an addon to https://github.com/silvanmelchior/RPi_Cam_Web_Interface.

Using an EC2 server to automate backups from the RPI zero, for camera and video feeds while deleting data on the rpi.

There are two scripts one for the ec2 server and one for the rpi zero.

The script for rpi zero backups up the videos/images per day to the remote ec2 server hosted by aws and then deletes the data recorded on the rpi zero to save space.

The script for the ec2 server makes a new directory with month - day - year. 

Every day at the same time (described in crontab) the rpi zero backs up the data to the ec2 server.

### Steps (Assuming a setup using https://github.com/silvanmelchior/RPi_Cam_Web_Interface)

cd ~

git clone https://github.com/ByVictorrr/RPI-Camera-EC2-Backup

cd RPI-Camera-EC2-Backup

sudo chmod +x *.sh

sftp -i /path/my-key-pair.pem ec2-user@public_dns_name

#### For the server:
* sudo apt-get intall rsync
* sudo apt-get install cron
* crontab -e

Text editor will apear type (This script will run ever day at 12 am) 

0 0 * * * ~/RPI-Camera-EC2-Backup/ec2Script.sh


#### For the RPI zero:
* sudo apt-get intall rsync
* sudo apt-get install cron
* crontab -e

Text editor will apear type (This script will run ever day at 12 am) 

0 0 * * * ~/RPI-Camera-EC2-Backup/rpiZeroScript.sh

### Learned
* rsync
* cron



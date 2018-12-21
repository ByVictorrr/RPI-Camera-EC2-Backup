# Added Feature Involving EC2 to silvanmelchior/RPi_Cam_Web_Interface

There are two scripts one for the ec2 server and one for the rpi zero.

The script for rpi zero backups up the videos/images per day to the remote ec2 server created by aws and then deletes the data recorded on the rpi zero to save space.

The script for the ec2 server makes a new director with month - yr - day every day at the same time the rpi zero backs up the data to the ec2 server.

## steps

cd ~
git clone https://github.com/ByVictorrr/RPI-Camera-EC2-Backup
cd RPI-Camera-EC2-Backup
sudo chmod +x *.sh
sftp -i /path/my-key-pair.pem ec2-user@public_dns_name

### For the server:
* sudo apt-get install cron
* crontab -e
Text editor will apear type (This script will run ever day at 12 am) 

0 0 * * * ~/RPI-Camera-EC2-Backup/ec2Script.sh


### For the RPI zero:
* sudo apt-get install cron
* crontab -e

Text editor will apear type (This script will run ever day at 12 am) 

0 0 * * * ~/RPI-Camera-EC2-Backup/rpiZeroScript.sh


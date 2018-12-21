# RPI Camera EC2 BACKUP

This project is essentially an addon to https://github.com/silvanmelchior/RPi_Cam_Web_Interface.

Using an EC2 server to automate backups from the RPI zero, for camera and video feeds while deleting data on the rpi.

There are two scripts one for the ec2 server and one for the rpi zero.

The script for rpi zero backups up the videos/images per day to the remote ec2 server hosted by aws and then deletes the data recorded on the rpi zero to save space.

The script for the ec2 server makes a new directory with month - day - year. 

Every day at the same time (described in crontab) the rpi zero backs up the data to the ec2 server.

Every month it deletes the old data on the ec2 server to make more space for the current month.

### Steps (Assuming a setup using https://github.com/silvanmelchior/RPi_Cam_Web_Interface)

cd ~

git clone https://github.com/ByVictorrr/RPI-Camera-EC2-Backup

cd RPI-Camera-EC2-Backup

sudo chmod +x *.sh

sftp -i /path/my-key-pair.pem ec2-user@public_dns_name

cd ~

put ec2Script.sh .

exit

ssh -i /path/my-key-pair.pem ec2-user@public_dns_name

sudo mkdir /var/www/html/Camera

#### For the server:
* sudo apt-get intall rsync
* sudo apt-get install cron
* crontab -e
* service apache2 enable
* service apache2 restart

Text editor will apear type (This script will run ever day at 12 am) 

0 0 * * * ~/ec2Script.sh

0 0 1 * * rm -rf /var/www/html/Camera/*

exit

#### For the RPI zero:
* sudo apt-get intall rsync
* sudo apt-get install cron
* crontab -e

Text editor will apear type (This script will run ever day at 12 am) 

0 0 * * * ~/RPI-Camera-EC2-Backup/rpiZeroScript.sh

##### To download images/videos

Go on to any web browser and type(of your ec2 instance): public_dns_name

<img src="https://github.com/ByVictorrr/RPI-Camera-EC2-Backup/blob/master/images/ec2-1.jpg" width="300" height="400">

<img src="https://github.com/ByVictorrr/RPI-Camera-EC2-Backup/blob/master/images/ec2-2.jpg" width="300" height="400">


### Learned
* rsync
* cron



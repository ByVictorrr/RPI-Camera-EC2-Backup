# EC2 addon to https://github.com/silvanmelchior/RPi_Cam_Web_Interface

There are two scripts one for the ec2 server and one for the rpi zero.

The script for rpi zero backups up the videos/images per day to the remote ec2 server created by aws and then deletes the data recorded on the rpi zero to save space.
The script for the ec2 server makes a new director with month- yr - day every day at the same time the rpi zero backs up the data to the ec2 server.

### steps

git clone https

RPI-Camera-EC2-Backup

For the server:
* apt-get install cron
* cront

For the RPI zero:

* apt-get install cron

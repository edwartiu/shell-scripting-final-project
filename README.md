# Linux & Shell Scripting Final Project
Final project for the 'Hands-on Introduction to Linux Commands and Shell Scripting' course from IBM. The course is part of the IBM DevOps and Software Engineer Professional Certificate.

For the final project I have been tasked with creating a shell script which runs everyday and automatically backs any encrypted password files that have been updated in the past 24 hours.

A template was provided which can be downloaded at the following link https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-LX0117EN-SkillsNetwork/labs/Final%20Project/backup.sh


## Local Implementation

### Executable Script 
To implement the script locally you must first download ```backup.sh``` and ensure it has the correct permissions. Running the script requires executable permissions. To check the permissions enter the command ```ls -l``` where the file is located. If executable permissions are not on, enter the command ```chmod +x backup.sh``` to give the file the correct permissions. Once again, you can use the command ```ls -l``` to check file permissions.

### Scheduling with Cron
First we will make a copy of ```backup.sh``` into ```/usr/local/bin```. To do so, you can run the following command ```sudo cp backup.sh /usr/local/bin```. Now we can schedule with cron using the the cron table. To access the cron table input the following command into a terminal ```crontab -e```, this allows you to edit the cron table with your own jobs. To schedule a backup every 24 hours you can enter the following into the cron table:
```
0 0 * * * /usr/local/bin/backup.sh [/path/to/directory/to/backup] [/path/to/directory/to/store/backup]
```
This schedules a backup at midnight but can be edited to your desired time. You have now successfully scheduled a daily backup of important files!

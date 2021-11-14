# Alarm
A shell script to play an alarm at a predetermined time. Optional feature for [dwm-bar](https://github.com/joestandring/dwm-bar).
## Features
* Creates a temporary file so the current status can be used in other scripts (e.g. [dwm-bar](https://github.com/joestandring/dwm-bar)).
* Alerts the user with a notification.
* Prevents multiple instances of the script running at once.
## Optional dependencies
* libnotify for notifications
* mpv to play alarm sound
## Installation
1. Clone the repository:
```sh
$ git clone https://github.com/joestandring/alarm
```
2. Enter the directory:
```sh
$ cd alarm
```
3. Allow running of the script:
```sh
$ chmod +x alarm.sh
```
4. Optionally add it to a directory in the PATH:
```sh
$ sudo cp alarm.sh /bin/
```
5. Run the script:
```sh
$ ./alarm.sh
```
## Configuration
For an alarm sound to play, you must edit the "ALARMSOUND" variable in alarm.sh:
```sh
ALARMSOUND="/path/to/alarmsound.mp3"
```
## How to use
You can run alarm.sh with 3 arguments corresponding to the time for the alarm to play (HH:MM:SS):
```sh
$ ./alarm.sh 14 30 0
Alarm set for 14:30:00
```
Alternatively, if you run the script with less than 3 arguments, you will be prompted for the hour, minute, and second:
```sh
$ ./alarm.sh
Hour: 1
Minute: 30
Second: 0

Alarm set for 14:30:00
```
If you want to stop the countdown, you can run
```sh
killall alarm.sh
```

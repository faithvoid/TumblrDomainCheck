# TumblrDomainCheck
Shell script that periodically checks every hour if a (set of) tumblr URL(s) are available or not. Linux/macOS compatible (and Windows compatible using WSL).

## How to use:
Modify the shell script with the URL(s) you want to monitor, modify the time if needed (this may trigger anti-bot behaviour, you've been warned. Default value is 3600 seconds or 1 hour) and run the script. You'll get a desktop notification if the URL is free or not!

Requires the libnotify dependency for notifications on Linux.

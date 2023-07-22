# TumblrDomainCheck
Shell script that periodically checks every hour if a (set of) tumblr URL(s) are available or not. Linux/macOS compatible (and Windows compatible using WSL).

## How to use:
Modify the shell script with the URL(s) you want to monitor, modify the time if needed (this may trigger anti-bot behaviour, you've been warned. Default value is 3600 seconds or 1 hour) and run the script either in terminal or in the background. You'll get a desktop notification if the URL is free or not!

Requires the libnotify dependency for notifications on Linux.

## How it works:
The script parses each listed Tumblr page for the words "There's nothing here.". If it finds those words, it notifies the user that the domain is available, otherwise it does nothing and scans again after the alloted time period.  

## Why?
It's hard as hell to get good URLs on tumblr! This ups your odds of getting a URL you really like. 

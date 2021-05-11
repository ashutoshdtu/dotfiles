#!/bin/bash

# Set lockfile name and location 
#LOCKFILE="/tmp/cron-sync.lock"
CURRENTDATE=`date +"%Y-%m-%d"`
LOCKFILE="/tmp/cron-sync-${CURRENTDATE}.lock"

# If the lockfile exists, exit
if [[ -f $LOCKFILE ]]; then 
  exit;
else 
  touch $LOCKFILE
fi


if [[ $(mount | awk '$3 == "/Volumes/Mac-Ext" {print $3}') != "" ]] && [[ $(mount | awk '$3 == "/Volumes/ASHUTOSH-EXT" {print $3}') != "" ]]; then
  rsync -aE /Volumes/Mac-Ext/Installers/ /Volumes/ASHUTOSH-EXT/Installers/
  rsync -aE /Volumes/Mac-Ext/Applications/ /Volumes/ASHUTOSH-EXT/Applications/
  rsync -aE /Volumes/Mac-Ext/Desktop/ /Volumes/ASHUTOSH-EXT/Desktop/
  rsync -aE /Volumes/Mac-Ext/Documents/ /Volumes/ASHUTOSH-EXT/Documents/
  rsync -aE /Volumes/Mac-Ext/Downloads/ /Volumes/ASHUTOSH-EXT/Downloads/
  rsync -aE /Volumes/Mac-Ext/Pictures/ /Volumes/ASHUTOSH-EXT/Pictures/
  rsync -aE /Volumes/Mac-Ext/dotfiles_backup/ /Volumes/ASHUTOSH-EXT/dotfiles_backup/
  rsync -aE /Volumes/Mac-Ext/Secure/ /Volumes/ASHUTOSH-EXT/Secure/
  rsync -aE /Volumes/Mac-Ext/workspace/ /Volumes/ASHUTOSH-EXT/workspace/
  rsync -aE /Volumes/Mac-Ext/Dropbox/ /Volumes/ASHUTOSH-EXT/Dropbox/
  rsync -aE /Volumes/Mac-Ext/Music/ /Volumes/ASHUTOSH-EXT/Music/
  rsync -aE --exclude '*.parts' --exclude 'Anime' --exclude 'Movies' --exclude 'TV Shows' /Volumes/Mac-Ext/Videos/ /Volumes/ASHUTOSH-EXT/Videos/
fi

if [[ $(mount | awk '$3 == "/Volumes/Mac-Ext" {print $3}') != "" ]] && [[ $(mount | awk '$3 == "/Volumes/MEDIA" {print $3}') != "" ]]; then
  rsync -aE --exclude '*.parts' /Volumes/Mac-Ext/Videos/Anime/ /Volumes/MEDIA/Videos/Anime/
  rsync -aE --exclude '*.parts' /Volumes/Mac-Ext/Videos/Movies/ /Volumes/MEDIA/Videos/Movies/
  rsync -aE --exclude '*.parts' /Volumes/Mac-Ext/Videos/TV\ Shows/ /Volumes/MEDIA/Videos/TV\ Shows/
fi

rm -f $LOCKFILE


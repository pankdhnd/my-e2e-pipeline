#!/bin/bash

#Specify application directory name
DIR=app
PACKAGE=app.tar.gz
#Check if application directory exists. If yes, then delete the directory
if [[ -d $DIR ]]
then
  rm -r $DIR
fi

#Recreate the application directory
mkdir $DIR

#Copy package files to application
cp -R public views app.js package.json app

#Check if package already exists. If yes, the delete the old package
if [[ -f $PACKAGE ]]
then
  rm $PACKAGE
fi

#Create the new package
tar -czvf app.tar.gz app

#Clean the application directory
rm -r $DIR
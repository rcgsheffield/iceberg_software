#!/bin/bash

# This is a template script for building and installing software on iceberg.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.

############################# Module Loads ###################################


############################## Variable Setup ################################
version=614
prefix=/usr/local/packages/apps/abaqus/$version
package_dir=/scratch/$USER/abaqus_package

filename=/usr/local/media/abaqus/ABAQUS-614-2/setup
baseurl=

# Set this to 'sudo' if you want to create the install dir using sudo.
#sudo='sudo'

##############################################################################
# This should not need modifying
##############################################################################

# Create the install directory
if [ ! -d $prefix ]
then
   mkdir -p $prefix
   chown -R $USER $prefix
   chgrp -R app-admins $prefix
fi 

#create package directory
if [ ! -d $package_dir ]; then
    mkdir -p $package_dir
fi

#create source directory
#if [ ! -d $source_dir ]; then
#    mkdir -p $source_dir
#fi

cd $package_dir

# Download the source
if [ -e $filename ]                                               
then                                                                            
  echo "Install tarball exists. Download not required."                         
else                                                                            
  echo "Downloading source" 
  wget $baseurl/$filename
fi

##############################################################################

##############################################################################
# Installation (Write the install script here)
##############################################################################

$filename

# follow the Abaqus GUI install instructions,
# in GUI set install directory to
# /usr/local/packages/apps/abaqus/614
# the licence server is 27000@abaqus.lm.shef.ac.uk
# this is a binary install

bash
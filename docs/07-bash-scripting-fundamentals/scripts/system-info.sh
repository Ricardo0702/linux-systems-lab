#!/usr/bin/bash

#########################################
# Configuration
#########################################

DEFAULT_ROOT_THRESHOLD=90

#########################################
# Functions
#########################################

print_help() {

    echo
    echo "Linux Systems Lab - System Information Report"
    echo
    echo "Usage:"
    echo "    $0 [threshold]"
    echo
    echo "Arguments:"
    echo "    threshold    Integer between 0 and 100."
    echo "                 Default: $DEFAULT_ROOT_THRESHOLD"
    echo
    echo "Examples:"
    echo "    $0"
    echo "    $0 80"
    echo "    $0 95"
    echo

}

print_header() {

    echo "=================================="
    echo " Linux Systems Lab"
    echo " System Information Report"
    echo "=================================="
    echo

}

print_system_information() {

    echo "Current User:      $CURRENT_USER"
    echo "Hostname:          $SYSTEM_HOSTNAME"
    echo "Current Directory: $CURRENT_DIRECTORY"
    echo "Current Date:      $CURRENT_DATE"
    echo

    if [ "$CURRENT_USER" = "root" ]
    then
        echo "Privilege Level:   Administrator"
    else
        echo "Privilege Level:   Standard User"
    fi

    echo

}

print_storage_information() {

    echo "Root Filesystem:   $ROOT_USAGE"
    echo "Alert Threshold:   ${ROOT_THRESHOLD}%"

    if [ "$ROOT_USAGE_PERCENT" -gt "$ROOT_THRESHOLD" ]
    then
        echo "Status:            WARNING"
    else
        echo "Status:            OK"
    fi

    echo

}

#########################################
# Main
#########################################

# Help option

if [ "$1" = "--help" ]
then
    print_help
    exit 0
fi

# Argument count validation

if [ "$#" -gt 1 ]
then
    echo "Error: too many arguments."
    echo "Use '$0 --help' for usage information."
    exit 1
fi

# Threshold validation

if [ -z "$1" ]
then
    ROOT_THRESHOLD=$DEFAULT_ROOT_THRESHOLD
else
    if [[ "$1" =~ ^[0-9]+$ ]]
    then
        if [ "$1" -ge 0 ] && [ "$1" -le 100 ]
        then
            ROOT_THRESHOLD=$1
        else
            echo "Error: threshold must be between 0 and 100."
            exit 1
        fi
    else
        echo "Error: threshold must be an integer between 0 and 100."
        exit 1
    fi
fi

# Runtime system information

CURRENT_USER=$(whoami)
CURRENT_DIRECTORY=$PWD
CURRENT_DATE=$(date)
SYSTEM_HOSTNAME=$(hostname)

ROOT_USAGE=$(findmnt -no TARGET,SOURCE,FSTYPE,USE% / | awk '{print $4}')
ROOT_USAGE_PERCENT=${ROOT_USAGE%\%}

# Report generation

print_header
print_system_information
print_storage_information
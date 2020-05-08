#!/usr/bin/env bash

#https://unix.stackexchange.com/questions/305466/using-single-dash-with-long-name

if [ ! $# -eq 1 ]; then
    echo >&2 "$0: requires an argument"
    exit 1
  fi


PATH=$PATH:/usr/bin

function echo_line () {
   echo "________________________________________________________"
}

function vol_info () {
	echo VOLINFO
	echo_line
   	df -h | egrep "disk|mapper" 
	echo_line
}

function cpu_info () {
	echo CPUINFO
	echo_line
   lscpu
	echo_line
}

function mem_info () {
	echo MEMINFO
	echo_line
   grep "MemTotal" /proc/meminfo
	echo_line
}

function nw_info () {
	echo NWINFO
	echo_line
	ip addr | egrep "inet\>" | awk '{print $2}'
	ip addr | egrep "ether\>" | awk '{print $2}' | sort | uniq
	echo_line
}

case "$1" in
        -volumes) vol_info
	;;
        -cpu) cpu_info
	;;
        -ram) mem_info
	;;
        -network) nw_info
	;;
        -all) 	vol_info
		cpu_info
		mem_info
		nw_info
	;;
        *) echo >&2 "Usage $0: -volumes|-cpu|-ram|-network|-all";;
esac

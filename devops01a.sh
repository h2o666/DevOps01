#!/usr/bin/env bash

PATH=$PATH:/usr/bin

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




vol_info
cpu_info
mem_info
nw_info

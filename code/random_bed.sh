#!/usr/bin/env bash
#
# Written by Dave Tang
# Year 2024
#
set -euo pipefail

# default settings
LINES=10
VER=0.1.0

usage(){
>&2 cat << EOF
Usage: $0 [ -l | --lines ]
EOF
exit 1
}

print_ver(){
   >&2 echo ${VER}
   exit 0
}

args=$(getopt -a -o hl:v --long help,lines:,version -- "$@")

eval set -- ${args}
while :
do
  case $1 in
    -h | --help)    usage      ; shift   ;;
    -v | --version) print_ver  ; shift   ;;
    -l | --lines)   LINES=$2   ; shift 2 ;;
    # -- means the end of the arguments; drop this, and break out of the while loop
    --) shift; break ;;
    *) >&2 echo Unsupported option: $1
       usage ;;
  esac
done

random_num(){
   CEILING=10000
   if [[ $# > 0 ]]; then
      CEILING=$1
   fi
   echo $(shuf -i 0-${CEILING} -n 1)
}

for ((i=0;i<${LINES};i++)); do
   CHR=chr$(random_num 22)
   START=$(random_num 2000000)
   END=$(( ${START}+100 ))
   echo -e "${CHR}\t${START}\t${END}"
done
exit 0

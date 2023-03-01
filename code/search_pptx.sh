#!/usr/bin/env bash

set -euo pipefail

ignorecase=0
verbose=0
tmp=/tmp

usage(){
>&2 cat << EOF
Usage: $0
   [ -i     | --ignore-case ]
   [ -v     | --verbose ]
   [ -t dir | --tmp dir ]
   <in.pptx> <search_term>
EOF
exit 1
}

check_depend (){
   tool=$1
   if [[ ! -x $(command -v ${tool}) ]]; then
     >&2 echo Could not find ${tool}
     exit 1
   fi
}

check_file (){
   infile=$1
   if [[ ! -e ${infile} ]]; then
     >&2 echo ${infile} does not exist
     exit 1
   fi
}

now(){
   date '+%Y/%m/%d %H:%M:%S'
}

args=$(getopt -a -o ivht: --long ignore-case,verbose,help,tmp: -- "$@")
if [[ $? -gt 0 ]]; then
  usage
fi

eval set -- ${args}
while :
do
  case $1 in
    -i | --ignore-case) ignorecase=1 ; shift   ;;
    -v | --verbose)     verbose=1    ; shift   ;;
    -h | --help)        usage        ; shift   ;;
    -t | --tmp)         tmp=$2       ; shift 2 ;;
    # -- means the end of the arguments; drop this, and break out of the while loop
    --) shift; break ;;
    *) >&2 echo Unsupported option: $1
       usage ;;
  esac
done

if [[ $# -ne 2 ]]; then
  usage
fi
pptx=$1
word=$2

dependencies=(unzip)
for tool in ${dependencies[@]}; do
   check_depend ${tool}
done

check_file ${pptx}

SECONDS=0
[[ ${verbose} -gt 0 ]] && >&2 printf "[ %s %s ] Searching $(basename ${pptx})\n" $(now)

duration=$SECONDS
rand=$$$RANDOM
tmpdir=${tmp}/${rand}

if [[ -d ${tmpdir} ]]; then
   >&2 echo ${tmpdir} already exists!
   exit 1
else
   mkdir ${tmpdir}
fi

cp ${pptx} ${tmpdir}
cd ${tmpdir} && unzip -q $(basename ${pptx})

if [[ ! -d ppt/slides/ ]]; then
   >&2 echo No slides found
   exit 1
fi

search=unset
if [[ ${ignorecase} -eq 1 ]]; then
   search=$(grep -li ${word} ppt/slides/*.xml || true)
else
   search=$(grep -l ${word} ppt/slides/*.xml || true)
fi

if [[ -z ${search} ]]; then
   echo ${word} was not found in ${pptx}
else
   for s in ${search[@]}; do
      slide=$(basename ${s} .xml)
      echo ${word} was found in ${pptx} on ${slide}
   done
fi

cd /tmp && rm -rf ${tmpdir}

[[ ${verbose} -gt 0 ]] && >&2 printf "[ %s %s ] Completed.\n" $(now)
[[ ${verbose} -gt 0 ]] && >&2 echo -e "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed.\n"

exit 0

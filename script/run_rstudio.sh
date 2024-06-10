#!/usr/bin/env bash

set -euo pipefail

version=4.4.0
rstudio_image=davetang/rstudio:${version}
container_name=rstudio_muse
port=7777
path=$(realpath $(dirname $0)/..)
package_dir=${path}/r_packages_${version}

if [[ ! -d ${package_dir} ]]; then
   mkdir ${package_dir}
fi

docker run -d \
   --rm \
   -p ${port}:8787 \
   --name ${container_name} \
   -v ${package_dir}:/packages \
   -v ${HOME}/data:/data \
   -v ${path}:/home/rstudio/muse \
   -e PASSWORD=password \
   -e USERID=$(id -u) \
   -e GROUPID=$(id -g) \
   ${rstudio_image}

>&2 echo ${container_name} listening on port ${port}
exit 0

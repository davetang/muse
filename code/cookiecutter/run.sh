#!/usr/bin/env bash

set -euo pipefail

rm -rf new_project
mkdir new_project && cd new_project

cat <<EOF > cookiecutter.json
{
   "project_name": "new_project",
   "documentation": "doc",
   "data": "data",
   "source": "src",
   "bin": "bin",
   "results": "results",
   "README": "README"
}
EOF

mkdir {{cookiecutter.project_name}} && cd {{cookiecutter.project_name}}

mkdir {{cookiecutter.documentation}}
mkdir {{cookiecutter.data}}
mkdir {{cookiecutter.source}}
mkdir {{cookiecutter.bin}} 
mkdir {{cookiecutter.results}}

url=https://gist.githubusercontent.com/PurpleBooth/109311bb0361f32d87a2/raw/824da51d0763e6855c338cc8107b2ff890e7dd43/README-Template.md

wget -O - ${url} \
   | sed 's/Project Title/{{cookiecutter.project_name}}/' \
   > {{cookiecutter.README}}.md

cd ../..

tree --charset unicode new_project
>&2 echo Done
exit 0

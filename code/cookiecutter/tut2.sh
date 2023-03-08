#!/usr/bin/env bash

set -euo pipefail

pn=cookiecutter-website-simple

rm -rf ${pn}
mkdir ${pn} && cd ${pn}

cat <<EOF > cookiecutter.json
{
  "project_name": "Cookiecutter Website Simple",
  "project_slug": "{{ cookiecutter.project_name.lower().replace(' ', '_') }}",
  "author": "Anonymous"
}
EOF

proj_dir={{cookiecutter.project_slug}}
mkdir ${proj_dir} && cd ${proj_dir}

cat <<EOF > index.html
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>{{ cookiecutter.project_name }}</title>
    </head>

    <body>
        <h1>{{ cookiecutter.project_name }}</h1>
        <p>by {{ cookiecutter.author }}</p>
    </body>
</html>
EOF

cd ../..
ZIP=cookiecutter.zip
zip --quiet -r ${ZIP} ${pn}

rm -rf ${pn}
cookiecutter ${ZIP}
rm ${ZIP}

>&2 echo Done
exit 0

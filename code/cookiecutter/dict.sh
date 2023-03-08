#!/usr/bin/env bash
#
# https://cookiecutter.readthedocs.io/en/latest/advanced/dict_variables.html
#

set -euo pipefail

pn=dictionary_variables

rm -rf ${pn}
mkdir ${pn} && cd ${pn}

cat <<EOF > cookiecutter.json
{
  "project_name": "Dictionary variables",
  "project_slug": "{{ cookiecutter.project_name.lower().replace(' ', '_') }}",
  "file_types": [
    {
      "png": {
        "name": "Portable Network Graphic",
        "library": "libpng",
        "apps": [
          "GIMP"
        ]
      }
    },
    {
      "bmp": {
        "name": "Bitmap",
        "library": "libbmp",
        "apps": [
          "Paint",
          "GIMP"
        ]
      }
    }
  ]
}
EOF

proj_dir={{cookiecutter.project_slug}}
mkdir ${proj_dir} && cd ${proj_dir}

cat <<EOF > README.md
{% for extension, details in cookiecutter.file_types|dictsort %}
<dl>
  <dt>Format name:</dt>
  <dd>{{ details.name }}</dd>

  <dt>Extension:</dt>
  <dd>{{ extension }}</dd>

  <dt>Applications:</dt>
  <dd>
      <ul>
      {% for app in details.apps -%}
          <li>{{ app }}</li>
      {% endfor -%}
      </ul>
  </dd>
</dl>
{% endfor %}
EOF

cd ../..
ZIP=dict.zip
zip --quiet -r ${ZIP} ${pn}

rm -rf ${pn}
cookiecutter ${ZIP}
rm ${ZIP}

>&2 echo Done
exit 0

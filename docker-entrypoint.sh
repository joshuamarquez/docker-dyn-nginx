#!/bin/bash

set -eo pipefail

if [ "$1" == "nginx" ]; then
  IFS=',' read -ra TPLS <<< "$TEMPLATES"
  for i in "${TPLS[@]}"; do
    template=${i//_/-}
    template=${template,,}

    if [ -f "/templates/${template}.template" ]; then
      envsubst "$(</templates/${template}.list)" < /templates/${template}.template > /etc/nginx/conf.d/$template.conf
      echo "Template ${template} applied!"
    else
      echo "Invalid template ${template}!"
    fi
  done
fi

exec "$@"
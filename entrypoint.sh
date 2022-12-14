#!/usr/bin/env sh

JSON_FILE_PATH=$1
FIELD_VALUE_PAIRS=$2

ROOT_DIR=${RUNNER_TEMP:-./}

OUTPUT_FILE_PATH="${ROOT_DIR}/$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '').json"

python -m render_json.render \
  --json-file-path "${JSON_FILE_PATH}" \
  --field-value-pairs "${FIELD_VALUE_PAIRS}" \
  --output-file-path "${OUTPUT_FILE_PATH}"

echo "::set-output name=rendered-json-file::${OUTPUT_FILE_PATH}"

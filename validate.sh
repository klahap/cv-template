#!/usr/bin/env bash

set -euo pipefail

npm install -g ajv-cli
npx ajv validate -s schemas/labels-schema.yaml -d "input/locales/*/labels.yaml" --spec=draft7 --errors=text
npx ajv validate -s schemas/content-schema.yaml -d "input/locales/*/content.yaml" --spec=draft7 --errors=text
npx ajv validate -s schemas/profile-schema.yaml -d input/profile.yaml --spec=draft7 --errors=text

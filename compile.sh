#!/usr/bin/env bash

set -euo pipefail

release_version="${RELEASE_VERSION:-dev}"

watch_mode=false

# Parse arguments
for arg in "$@"; do
  case "$arg" in
    --watch)
      watch_mode=true
      ;;
  esac
done

for file in content/translations/*.yaml; do
  translation="$(basename "$file" .yaml)"

  if [ "$watch_mode" = true ]; then
    typst watch \
      --font-path ./fonts \
      --input translationFile="$file" \
      --input releaseVersion="$release_version" \
      main.typ \
      "dist/cv-${translation}.pdf" &
  else
    typst compile \
      --font-path ./fonts \
      --input translationFile="$file" \
      --input releaseVersion="$release_version" \
      main.typ \
      "dist/cv-${translation}.pdf"
  fi
done

if [ "$watch_mode" = true ]; then
  wait
fi

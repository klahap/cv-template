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

for locale_dir in input/locales/*/; do
  locale="$(basename "$locale_dir")"

  if [ "$watch_mode" = true ]; then
    typst watch \
      --font-path ./fonts \
      --input labelsFile="${locale_dir}labels.yaml" \
      --input contentFile="${locale_dir}content.yaml" \
      --input releaseVersion="$release_version" \
      main.typ \
      "dist/cv-${locale}.pdf" &
  else
    typst compile \
      --font-path ./fonts \
      --input labelsFile="${locale_dir}labels.yaml" \
      --input contentFile="${locale_dir}content.yaml" \
      --input releaseVersion="$release_version" \
      main.typ \
      "dist/cv-${locale}.pdf"
  fi
done

if [ "$watch_mode" = true ]; then
  wait
fi

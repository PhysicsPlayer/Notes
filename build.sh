#!/usr/bin/env bash

set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
build_dir="$root_dir/build"

if ! command -v latexmk >/dev/null 2>&1; then
  printf 'Error: latexmk was not found in PATH.\n' >&2
  exit 1
fi

mapfile -t part_files < <(find "$build_dir" -maxdepth 1 -type f -name '*.tex' -print | sort)

if ((${#part_files[@]} == 0)); then
  printf 'Error: no part entry files were found in %s.\n' "$build_dir" >&2
  exit 1
fi

printf 'Compiling %d part document(s)...\n' "${#part_files[@]}"
(
  cd "$build_dir"
  for part_file in "${part_files[@]}"; do
    part_name="$(basename "$part_file")"
    printf '  build/%s\n' "$part_name"
    latexmk -xelatex -interaction=nonstopmode -halt-on-error "$part_name"
  done
)

printf 'Compiling main.tex...\n'
latexmk -xelatex -interaction=nonstopmode -halt-on-error \
  "$root_dir/main.tex"

printf 'Compilation completed.\n'

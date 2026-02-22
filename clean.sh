#!/usr/bin/env bash

# LaTeX cleaning script (bash version)
set -euo pipefail

# Directory where the script lives (root to clean recursively)
root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Extensions to clean
extensions=(
  "*.aux" "*.bcf" "*.log" "*.out" "*.run.xml" "*.toc"
  "*.synctex.gz" "*.fdb_latexmk" "*.fls" "*.blg" "*.bbl"
)

cyan="\033[36m"; gray="\033[90m"; green="\033[32m"; reset="\033[0m"

printf "%bCleaning LaTeX intermediate files...%b\n" "$cyan" "$reset"

# Build the find expression from the extension list
find_expr=()
for ext in "${extensions[@]}"; do
  find_expr+=( -name "$ext" -o )
done
# Remove the trailing -o
unset 'find_expr[${#find_expr[@]}-1]'

# Find and delete files
find "$root_dir" -type f \( "${find_expr[@]}" \) -print |
  while IFS= read -r file; do
    printf "%bDeleting:%b %s\n" "$gray" "$reset" "$file"
  done

# Actually remove the files (separate run to keep output clean if deletion fails mid-stream)
find "$root_dir" -type f \( "${find_expr[@]}" \) -delete

printf "%bDone! Only .tex and .pdf files are kept.%b\n" "$green" "$reset"

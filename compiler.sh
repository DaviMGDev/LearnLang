#!/bin/bash
set -e

target="${1%/}"
output="${target}.md"
skip_names=("README.md" "AI_TRANSLATION_GUIDE.md")

[ -z "$target" ] && echo "usage: $0 <LearnLanguage/>" && exit 1
[ ! -d "$target" ] && echo "error: $target is not a directory" && exit 1

skip() {
    local name="${1##*/}"
    for s in "${skip_names[@]}"; do
        [[ "$name" == "$s" ]] && return 0
    done
    return 1
}

# First pass: check every file has a title
echo "checking titles..."
while IFS= read -r -d '' file; do
    skip "$file" && continue
    head=$(head -1 "$file")
    if [[ ! "$head" =~ ^#\  ]]; then
        echo "  warn: missing title — $file"
    fi
done < <(find "$target" -type f -name '*.md' -print0 | sort -z)

# Second pass: concatenate with boundaries
echo "compiling..."
> "$output"

first=true
while IFS= read -r -d '' file; do
    skip "$file" && continue

    title=$(head -1 "$file")
    body=$(tail -n +2 "$file")

    if $first; then
        first=false
    else
        printf "\n---\n\n" >> "$output"
    fi

    # Demote # → ## so the compiled doc nests cleanly
    demoted=$(echo "$title" | sed 's/^# /## /')
    echo "$demoted" >> "$output"
    echo "" >> "$output"
    echo "$body" >> "$output"
    echo "" >> "$output"
done < <(find "$target" -type f -name '*.md' -print0 | sort -z)

echo "done: $output"

#!/usr/bin/env bash
set -uo pipefail

# SKILL.md checks: frontmatter, required sections, anti-hard-wrap regression guards,
# and a guard against private names leaking into tracked files.

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL="$DIR/SKILL.md"
fail=0

check() {
    if eval "$2"; then
        echo "OK  $1"
    else
        echo "XX  $1"
        fail=1
    fi
}

check "SKILL.md exists"                              "[ -f '$SKILL' ]"
check "frontmatter name: email-drafting"             "grep -qE '^name: email-drafting' '$SKILL'"
check "frontmatter description present"             "grep -qE '^description: .' '$SKILL'"
check "description triggers in English and Italian" "grep -E '^description:' '$SKILL' | grep -q 'write an email' && grep -E '^description:' '$SKILL' | grep -q 'scrivi una mail'"
check "'Language' section present"                  "grep -qE '^## Language' '$SKILL'"
check "'Formatting and line breaks' section present" "grep -qE '^## Formatting and line breaks' '$SKILL'"
check "'Tone by language' section present"          "grep -qE '^## Tone by language' '$SKILL'"
check "tone section has an Italian example"         "grep -q '^Oggetto:' '$SKILL'"
check "tone section has an English example"         "grep -q '^Subject: Supply' '$SKILL'"
check "'Sending' section present"                   "grep -qE '^## Sending' '$SKILL'"
check "HTML sending prescribed (text/html)"         "grep -q 'text/html' '$SKILL'"
check "one <p> per paragraph prescribed"            "grep -q 'one \`<p>\` per paragraph' '$SKILL'"
check "draft by default restated"                   "grep -q 'Default: \*\*draft\*\*' '$SKILL'"
check "150-word ceiling present"                    "grep -q '150 words' '$SKILL'"

# Regression guard: no paragraph line in the prose may end mid-sentence on a bare word
# (the original template was hard-wrapped by hand). Code blocks are skipped.
check "no hard-wrapped prose lines" "! awk '/^\`\`\`/{c=!c; next} !c && NF && \$0 !~ /^(#|\\||- |---|[A-Za-z]+:)/ && \$0 !~ /[.:;,)?!*\`]\$/' '$SKILL' | grep -q ."

# Leak guard: tracked files must not contain any pattern listed in tests/private-names.txt
# (one extended regex per line, gitignored so the list itself never ships).
NAMES="$DIR/tests/private-names.txt"
if [ -f "$NAMES" ]; then
    check "no private names in tracked files" "! (cd '$DIR' && git ls-files -z | xargs -0 -r grep -liE -f '$NAMES' | grep -q .)"
else
    echo "--  leak guard skipped (no tests/private-names.txt)"
fi

exit $fail

# DEVPLAN - email-drafting

Mode: IDD

## Objective

A Claude Code skill that drafts short professional emails in Italian or English, with correct formatting on the recipient's side: no sentences broken mid-line, one idea per paragraph, an explicit call to action, sent as HTML, draft by default.

## Milestones

### M1 - Port + line-break fix

Status: completed ✅

The skill was ported from an earlier in-house agent platform. Its template had been hard-wrapped by hand, which made the model insert line breaks mid-sentence in the emails it wrote.

- [x] Skill directory in the dev tree
- [x] `SKILL.md`: ported content + "Formatting and line breaks" section + template rewritten on single lines
- [x] `install.sh`: deploys to `~/.claude/skills/email-drafting/`, `--force` / `--uninstall`
- [x] `README.md`
- [x] `tests/test_skill_md.sh`: frontmatter + anti-hard-wrap regression guards (7/7 green)
- [x] `./install.sh --force` -> deployed, md5 verified

### M3 - Send as HTML (the M1 fix did not survive the transport)

Status: completed (2026-07-29) ✅

M1 fixed how the skill writes: one continuous line per paragraph. That was not enough. `text/plain` is **hard-wrapped by the mail transport at 72-76 characters**, so a correctly written email still arrived with sentences broken mid-line. It surfaced on a real reply: the composed text was on continuous lines, the received one was not.

The email had also been declared "verified" by **reading it back through the same tool that sent it**, which re-joins lines on read. The check was circular: the defect was invisible from there and only the recipient saw it, in their own client.

- [x] `SKILL.md`: new **Sending** section — `text/html` with one `<p>` per paragraph, `<br>` only in the signature; explanation of the transport wrap; warning on circular verification; draft-by-default restated ("send it to X and I'll forward it" is not a go-ahead to send).
- [x] `tests/test_skill_md.sh`: 4 new guards — 11/11 green.
- [x] `README.md`: HTML sending section.
- [x] `./install.sh --force` + md5 check dev tree vs `~/.claude/skills/`.

### M4 - Public release: English, multilingual tone, scrub

Status: completed (2026-09-29) ✅

Published as `Ymx1ZQ/email-drafting-skill` (public). Before this the skill was Italian-only and its docs referred to private projects, so it was not installable by someone else as-is.

- [x] Translated `SKILL.md`, `README.md`, `DEVPLAN.md`, test messages to English. The skill writes the email in the language of the thread or of the request; the `description` triggers on both English and Italian phrasings.
- [x] New section **Tone by language**: register, salutation, opening, the ask and closing for Italian and English, with the same message written in both languages.
- [x] Content review: rules kept (150 words, one idea per paragraph, one call to action, subject ≤60 chars, HTML, draft by default); new "Language" section; rewrite-from-the-top rule; sending section no longer tied to one tool.
- [x] Scrub: no reference to private projects or counterparties in tracked files.
- [x] `LICENSE` (MIT) and `.gitignore`.
- [x] `tests/test_skill_md.sh`: guards on the English text, the tone section with both examples, and a guard against private names in tracked files.
- [x] Repo initialised, pushed to a public GitHub repo; `./install.sh --force` + md5 check.

### M5 - Attachments carry a descriptive name

Status: completed (2026-10-29) ✅

Requested by the operator on 2026-10-29 after two PDFs went out as `presentation.pdf` and a bare date.

- [x] `SKILL.md` §Sending: attach a copy named with client, content and ISO period; never a generic name or a bare date; name attachments in the body only when the email says "attached".
- [x] `tests/test_skill_md.sh`: guard on the rule.
- [x] Tests green; commit and push; `./install.sh --force`.

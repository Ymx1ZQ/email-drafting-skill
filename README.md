# email-drafting

A Claude Code skill that drafts short professional emails in Italian or English.

It triggers when you ask for an email in either language ("write an email to…", "reply to…", "scrivi una mail a…", "rispondi a…"), including when the request does not use the word "email", and produces a structured draft: subject, salutation, one context sentence, a short body, one call to action, closing.

## What it enforces

- **Length and structure**: at most 150 words, one idea per paragraph, one explicit call to action with an exact date when timing matters, subject at most 60 characters.
- **Language and register**: the email is written in the language of the thread or of the request. A *Tone by language* section sets salutation, register (*Lei*/*tu*, first names), directness of the ask and closing for Italian and English, with the same message written in both.
- **Formatting**: every paragraph is one continuous line; wrapping is left to the recipient's mail client.
- **Sending as HTML**: plain-text email is hard-wrapped by the mail transport at 72-76 characters, so the recipient sees sentences broken mid-line even when the draft was correct. The skill prescribes `text/html` with one `<p>` per paragraph, and warns that reading the email back through the tool that sent it does not reveal the wrap.
- **Draft by default**: the skill prepares a draft and sends only on an explicit go-ahead.

## Install

```bash
git clone https://github.com/Ymx1ZQ/email-drafting-skill.git
cd email-drafting-skill
./install.sh --force      # deploys to ~/.claude/skills/email-drafting/
./install.sh --uninstall  # removes the installed skill
```

Skills load at session start: restart Claude Code after installing.

## Customise

Edit `SKILL.md` to change the signature, the word limit, or to add a language to the *Tone by language* table, then run `./install.sh --force` again.

## Test

```bash
bash tests/test_skill_md.sh
```

## License

MIT

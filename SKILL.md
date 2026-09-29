---
name: email-drafting
description: Drafts professional emails in Italian or English, with the register each language expects. Use whenever the deliverable is an email — "write an email to…", "reply to…", "send a note about…", "scrivi una mail a…", "rispondi a…" — even when the request does not say "email", and for every rewrite of a draft already produced.
---

# Email drafting

Use this structure whenever you draft an email, including when you rewrite a draft you already produced: a draft edited inline does not become compliant by editing it, so re-apply these rules from the top.

## Language

Write the email in the language of the thread you are answering. For a new email, use the language the requester asks for; if they do not say, use the language of the request. Never mix languages inside one email, including the subject and the closing.

## Structure

```
Subject: [concise, max 60 characters, a concrete noun or an action — avoid "Re:", "Update", "Follow-up" on their own]

[Salutation — see Tone by language]

[1 sentence of context — why you are writing]

[Body: 1-3 short paragraphs. One idea per paragraph. Bullets only when listing more than 3 items.]

[Call to action: what you expect the recipient to do, and by when]

[Closing — see Tone by language]
[Signature name]
```

## Rules

- No more than 150 words unless a longer email is explicitly requested.
- Active sentences with an explicit subject.
- One explicit call to action. If you need nothing from the recipient, say so ("no reply needed").
- No slang abbreviations ("asap", "fyi", "btw").
- For anything time-bound, write "by [exact date]", never "as soon as possible".
- Every sentence must carry information the recipient needs. Delete openers like "I hope this email finds you well" and closers that restate the body.

## Tone by language

The same message needs different wording in Italian and English. Translating one into the other word for word produces an email that reads as either stiff or rude.

| | Italian | English |
|---|---|---|
| Register with someone you do not know | Formal *Lei*, surname or full name | First name is normal once they have signed with it; "Dear Ms Rossi" only for a first contact or a formal counterpart |
| Register with a colleague or known contact | *Tu*, first name | First name |
| Salutation | "Gentile [Nome Cognome]," (formal) · "Buongiorno [Nome]," (neutral) · "Ciao [Nome]," (known contact) | "Dear [Name]," (formal) · "Hi [Name]," (neutral and known contact) |
| Opening | A short context sentence is expected before the request | Get to the point in the first sentence |
| The ask | Softened with a conditional: "Le chiederei di…", "Potresti…?" | Direct but polite: "Could you…?", "Please send…" |
| Closing | "Cordiali saluti," (formal) · "Un saluto," / "A presto," (neutral) | "Best regards," (formal) · "Best," / "Thanks," (neutral) |

Keep the register of the thread: if the other person moved to *tu* or first names, follow them; do not move first.

### Example — the same request in both languages

Italian, formal counterpart:

```
Oggetto: Contratto di fornitura: firma entro il 10 ottobre

Gentile Dott.ssa Bianchi,

Le scrivo per chiudere il contratto di fornitura di cui abbiamo parlato martedì.

In allegato trova la versione finale, con la modifica all'articolo 4 che ci aveva chiesto: il pagamento passa a 60 giorni.

Le chiederei di rimandarmelo firmato entro il 10 ottobre, così da avviare la prima consegna a fine mese.

Cordiali saluti,
Marco Verdi
```

English, same counterpart:

```
Subject: Supply contract: signature by 10 October

Dear Ms Bianchi,

Attached is the final supply contract we discussed on Tuesday, with the change you asked for in Article 4: payment terms are now 60 days.

Could you return it signed by 10 October? That lets us schedule the first delivery for the end of the month.

Best regards,
Marco Verdi
```

The English version drops the context sentence and joins the ask with its reason; the Italian version keeps the context sentence and the conditional *chiederei*. Both carry the same facts, date and action.

## Formatting and line breaks

- A paragraph is **one continuous line**: never break a sentence with a manual line break. Wrapping inside a paragraph is the mail client's job.
- Separate blocks (salutation, paragraphs, call to action, closing) with **one blank line**. That blank line is the only line break you add yourself.
- In a bulleted list each item goes on its own line, and the item text stays on a single line.
- No hard wrap at a fixed width (72/80 columns): write the full paragraph and let it reflow to the reader's window.

## Sending

- Send emails as **HTML**: content type `text/html`, with **one `<p>` per paragraph**. No line breaks inside a paragraph; `<br>` only in the signature block.
- The reason: `text/plain` is **hard-wrapped by the mail transport at 72-76 characters**. "One paragraph is one continuous line" describes how you write, but it does not survive sending as plain text: the recipient gets sentences broken mid-line even when the text you composed was correct. In HTML a paragraph is a block and reflows to the reader's window.
- **Reading the email back with the same tool that sent it is not a check**: reading re-joins the lines and hides the wrap. To verify, open the message in a mail client — or remove the problem at the source by sending HTML.
- Default: **draft**, not send. Send only on an explicit go-ahead. "Send it to X and I'll forward it" is not that go-ahead: it is a request to prepare the material.

## When they only ask how to say it

When the requester only asks how to phrase something ("how do I tell them we finished part X?"), propose two alternatives — one more formal, one warmer — in the language of the request, and let them choose.

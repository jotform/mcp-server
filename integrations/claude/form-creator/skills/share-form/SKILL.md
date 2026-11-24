---
name: share-form
description: Give the link to an existing form, its website embed code or a QR code, or assign the form to someone by email. Use when the user asks for a form's link or wants to share, publish, embed or send a form to people. Not for showing the form itself (display-form). Sending a document for signature belongs to the Jotform Sign plugin.
metadata:
  version: "cdd4dfa4f432"
---

# Share a form

Use tools from the `jotform` connector. When another connector exposes the same short tool name, choose the tool that belongs to `jotform`. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Find the form: use the form ID the user supplied or this connector's `search`. Ask which form they mean only when more than one match is plausible. If no form matches the name the user gave, say so and ask; do not act on a different form instead.
2. Give the form link that `search` or `fetch` returned. Do not build a URL from a guessed ID.
3. When the connector has them, `get_embed_code` returns the code to paste into a website, so share it verbatim; `generate_qr_code` makes a QR code for the form link; `assign_form` assigns the form to a person by email. Use only an email address the user gave, and never make one up.

## Reply

Keep the reply short: the link or code, and nothing the user did not ask for. Do not reveal credentials.

---
name: display-form
description: Show an existing form so the user can see or try it. Use when the user asks to see, show, open, preview or view a specific form. Not for finding or listing forms (list-forms) or for sharing its link (share-form).
---

# Display a form

Use tools from the `jotform` connector. When another connector exposes the same short tool name, choose the tool that belongs to `jotform`. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Find the form: use the form ID the user supplied or this connector's `search`. Ask which form they mean only when more than one match is plausible. If no form matches the name the user gave, say so and ask; do not act on a different form instead.
2. Call `display_form` with the form ID.

## Reply

Keep the reply short and point to the rendered form. Do not repeat its questions.

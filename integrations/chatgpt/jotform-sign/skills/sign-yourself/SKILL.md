---
name: sign-yourself
description: Get the links to sign a sent document that is waiting on the user's own signature. Use when the user wants to sign a document themselves. Not for sending a document to other people (send-to-sign).
---

# Sign a document yourself

Use tools from the `jotform` connector. When another connector exposes the same short tool name, choose the tool that belongs to `jotform`. A Jotform form ID is not a Sign document ID. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Find the document: use a Sign identifier the user supplied or this connector's `search`. Resolve an ambiguous match before editing or sending. If no document matches the name the user gave, say so and ask; do not act on a different document instead.
2. If `get_signing_links` is available, it returns links for a sent document waiting on the current account's signature. Use the sent-document ID, share each link only with the person it is for, and say that signing happens in the browser.
3. Do not put personal signing links in a shared app, and do not claim to have signed for the user.

## Reply

Give the links and keep the reply short. Do not dump the document or private data. Do not describe a draft as sent or a sent document as signed. On an authentication, permission, missing-role, or readiness failure, explain it and stop the steps that depend on it.

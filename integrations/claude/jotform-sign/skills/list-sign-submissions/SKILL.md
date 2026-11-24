---
name: list-sign-submissions
description: List the completed signings of a document, the copies that everyone has signed. Use when the user asks for signed copies or the completed submissions of a document. To check who still has to sign, use check-signing-status.
metadata:
  version: "8b3738d2ca82"
---

# List completed signings

Use tools from the `jotform` connector. When another connector exposes the same short tool name, choose the tool that belongs to `jotform`. A Jotform form ID is not a Sign document ID. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Find the document: use a Sign identifier the user supplied or this connector's `search`. Resolve an ambiguous match before editing or sending. If no document matches the name the user gave, say so and ask; do not act on a different document instead.
2. Call `list_sign_submissions` (`list_submissions` on a connector with only Sign tools) with the document ID. It only lists completed signings, so a document that was never sent or is still waiting on someone shows none; check that with `get_signing_status`.

## Reply

Answer from what the tool returned, short. Do not dump the document or private data. Do not describe a draft as sent or a sent document as signed. On an authentication, permission, missing-role, or readiness failure, explain it and stop the steps that depend on it.

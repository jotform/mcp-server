---
name: check-signing-status
description: Check whether a document was sent and who has or has not signed it. Use when the user asks if someone signed, whether a document is completed, or what is still pending. Not for listing every completed signing (list-sign-submissions).
metadata:
  version: "d221743a5df7"
---

# Check signing status

Use tools from the `jotform` connector. When another connector exposes the same short tool name, choose the tool that belongs to `jotform`. A Jotform form ID is not a Sign document ID. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Find the document: use a Sign identifier the user supplied or this connector's `search`. Resolve an ambiguous match before editing or sending. If no document matches the name the user gave, say so and ask; do not act on a different document instead.
2. `get_signing_status` reads current status, so use it to answer whether someone has signed; it also shows a document that was never sent. `list_sign_submissions` (`list_submissions` on a connector with only Sign tools) only lists completed signings.
3. Status does not subscribe to updates. A sent-copy ID checks that copy. A draft ID may aggregate copies, so do not claim one copy is complete from an aggregate result.

## Reply

Answer from the returned status, short. Do not dump the document or private data. Do not describe a draft as sent or a sent document as signed. On an authentication, permission, missing-role, or readiness failure, explain it and stop the steps that depend on it.

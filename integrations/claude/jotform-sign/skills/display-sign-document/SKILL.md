---
name: display-sign-document
description: Show an existing signing document so the user can see it. Use when the user asks to see, open, preview or view a contract or agreement. Not for finding or listing documents (list-sign-documents) or for changing one (edit-sign-document).
metadata:
  version: "27e6919480ad"
---

# Display a signing document

Use tools from the `jotform` connector. When another connector exposes the same short tool name, choose the tool that belongs to `jotform`. A Jotform form ID is not a Sign document ID. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Find the document: use a Sign identifier the user supplied or this connector's `search`. Resolve an ambiguous match before editing or sending. If no document matches the name the user gave, say so and ask; do not act on a different document instead.
2. Call `display_sign_document` with the document ID.

## Reply

Point to the rendered document and keep the reply short. Do not dump the document or private data. Do not describe a draft as sent or a sent document as signed. On an authentication, permission, missing-role, or readiness failure, explain it and stop the steps that depend on it.

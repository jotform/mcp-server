---
name: list-sign-documents
description: Find or list the user's signing documents, such as contracts, agreements and NDAs, by name, topic or date. Use when the user asks which documents they have or looks for one. Not for showing one document (display-sign-document) or its signing status (check-signing-status).
---

# Find and list signing documents

Use tools from the `jotform` connector. When another connector exposes the same short tool name, choose the tool that belongs to `jotform`. A Jotform form ID is not a Sign document ID. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Use this connector's `search` with the user's terms, and answer from its results.
2. When the user wants to act on one document and more than one match is plausible, ask which one. If nothing matches, say so.

## Reply

Keep the reply short and do not repeat the whole list unless the user asks. Do not dump the document or private data. Do not describe a draft as sent or a sent document as signed. On an authentication, permission, missing-role, or readiness failure, explain it and stop the steps that depend on it.

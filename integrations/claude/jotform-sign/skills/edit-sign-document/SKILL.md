---
name: edit-sign-document
description: Change an existing signing document, such as adding, removing or rewording its clauses, terms, fields or content. Use when the user wants something changed in a contract or agreement they already have. Not for a new document (create-sign-document) or for its signers (send-to-sign).
metadata:
  version: "4b71875a8212"
---

# Edit a signing document

Use tools from the `jotform` connector. When another connector exposes the same short tool name, choose the tool that belongs to `jotform`. A Jotform form ID is not a Sign document ID. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Find the document: use a Sign identifier the user supplied or this connector's `search`. Resolve an ambiguous match before editing or sending. If no document matches the name the user gave, say so and ask; do not act on a different document instead.
2. Use `edit_sign_document` or `update_sign_document_content` for the change the user asked for. Leave unrelated content in place, and do not create a new document to satisfy an edit.
3. When the edit comes back asking for approval, because a document made from an upload is rebuilt, relay the question, call it again only after the user approves, and drop the edit if they decline.

A `processing` result is not a finished document. When this connector's `fetch` takes a Sign document id, check readiness with it and the returned document ID: while `metadata.build_status` is `processing`, wait `metadata.poll_after_seconds` and fetch again. Otherwise report the document as pending and keep its returned identifier. Do not call creation or editing again as a status check.

## Reply

Show the preview, the confirmed outcome, and the relevant next step. Say the change is in the document and that nothing was sent. Do not dump the document or private data. Do not describe a draft as sent or a sent document as signed. On an authentication, permission, missing-role, or readiness failure, explain it and stop the steps that depend on it.

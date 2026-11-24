---
name: create-sign-document
description: Prepare a new contract, agreement, NDA, lease, consent form or any other document people sign, from a description or an uploaded file, in any language. Use when the user wants a document to sign. Not for changing an existing document (edit-sign-document) or sending it (send-to-sign). A form, survey or RSVP is not a signing document.
metadata:
  version: "1e1b4c4991a3"
---

# Create a signing document

Use tools from the `jotform` connector. When another connector exposes the same short tool name, choose the tool that belongs to `jotform`. A Jotform form ID is not a Sign document ID. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Use `create_sign_document` with the user's `prompt` for a new document. Include `document_title` only where the live schema accepts it. An uploaded reference is not a promise to keep the original file as the final document. Do not invent legal terms, personal data, download URLs, or signer addresses.
2. Personal workspace uses `workspace_type: "personal"` and `team_id: ""`. For a team workspace, resolve the team with this connector's `get_teams`.
3. Creating a draft does not authorize email. Send it only when the user asked to send, following send-to-sign.

A `processing` result is not a finished document. When this connector's `fetch` takes a Sign document id, check readiness with it and the returned document ID: while `metadata.build_status` is `processing`, wait `metadata.poll_after_seconds` and fetch again. Otherwise report the document as pending and keep its returned identifier. Do not call creation or editing again as a status check.

## Reply

Show the preview, the confirmed outcome, and the relevant next step. Do not dump the document or private data. Do not describe a draft as sent or a sent document as signed. On an authentication, permission, missing-role, or readiness failure, explain it and stop the steps that depend on it.

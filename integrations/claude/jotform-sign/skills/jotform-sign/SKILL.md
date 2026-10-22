---
name: jotform-sign
description: Prepare or edit a contract, agreement, NDA, or consent document, set the signers, send a signature invitation when asked, or check who has signed. Use when the user wants something signed. A form, survey, or RSVP is not a signing document.
---

# Jotform Sign

Use tools from the `jotform-sign` connector. When another connector exposes the same short tool name, choose the tool that belongs to `jotform-sign`. A Jotform form ID is not a Sign document ID.

## Prepare and edit

1. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.
2. Find an existing signing asset with this connector's `search`, or use a Sign identifier the user supplied. Resolve an ambiguous match before editing or sending.
3. Use `create_sign_document` with the user's `prompt` for a new document. Include `document_title` or a file only where the live schema accepts them. An uploaded reference is not a promise to keep the original file as the final document. Do not invent legal terms, personal data, download URLs, or signer addresses.
4. Use `display_sign_document`, `edit_sign_document`, or `update_sign_document_content` for the change the user asked for. Leave unrelated content in place. For a team workspace, resolve the team with this connector's `get_teams`. For `create_sign_document`, personal workspace uses `workspace_type: "personal"` and `team_id: ""`.
5. A `processing` result is not a finished document. Check readiness only through the retrieval path this server documents. Do not call creation or editing again as a status check, and do not use the Forms or Apps `fetch`. If no status path is available, report the document as pending and keep its returned identifier.

## Configure and send

- Use `get_signers` and `update_signer` for the document's actual roles. Do not assume a new draft already has the intended recipients.
- Creating a draft does not authorize email. Call `send_for_signature` only when the user asked to send and the recipients and document are known. Ask only when something required is missing or ambiguous.
- Honor a requested signing order or reminder when the schema supports it. Do not add sends or reminders the user did not ask for.
- A send creates a separate sent copy. Keep a returned sent-copy ID apart from the draft ID, and report a send only when the tool result confirms it. On an ambiguous response, check status instead of sending again.
- `get_signing_status` reads current status. It does not subscribe to updates. A sent-copy ID checks that copy. A draft ID may aggregate copies, so do not claim one copy is complete from an aggregate result.

If `get_signing_links` is available, it returns links for a sent document waiting on the current account's signature. Use the sent-document ID, share each link only with the person it is for, and say that signing happens in the browser. Do not put personal signing links in a shared app, and do not claim to have signed for the user.

## Reply

Show the preview, the confirmed outcome, and the relevant next step. Do not dump the document or private data. Do not describe a draft as sent or a sent document as signed. On an authentication, permission, missing-role, or readiness failure, explain it and stop the steps that depend on it.

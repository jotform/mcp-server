---
name: send-to-sign
description: Set a document's signers and send it for signature, with a signing order or reminders when asked. Use when the user asks to send a document for signature, add or change signers, or share it with the people who sign. Not for checking who has signed (check-signing-status).
---

# Send a document for signature

Use tools from the `jotform` connector. When another connector exposes the same short tool name, choose the tool that belongs to `jotform`. A Jotform form ID is not a Sign document ID. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Find the document: use a Sign identifier the user supplied or this connector's `search`. Resolve an ambiguous match before editing or sending. If no document matches the name the user gave, say so and ask; do not act on a different document instead.
2. Before sending, read the document's actual roles with `get_signers`, set each role that lacks the intended name and email with `update_signer`, and only then call `send_for_signature`. Use only a name and email the user gave or a tool returned: if one is missing, ask for it, and never make up an address. Do not assume a new draft already has the intended recipients.
3. Creating a draft does not authorize email. Call `send_for_signature` only when the user asked to send and the recipients and document are known. Ask only when something required is missing or ambiguous.
4. Honor a requested signing order or reminder when the schema supports it. Do not add sends or reminders the user did not ask for.
5. A send creates a separate sent copy. Keep a returned sent-copy ID apart from the draft ID, and report a send only when the tool result confirms it. On an ambiguous response, check status instead of sending again.

## Reply

Show the confirmed outcome and the relevant next step. Do not dump the document or private data. Do not describe a draft as sent or a sent document as signed. On an authentication, permission, missing-role, or readiness failure, explain it and stop the steps that depend on it.

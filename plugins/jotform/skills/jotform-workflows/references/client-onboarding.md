# Client onboarding

## Example request

"Create a client onboarding form for contact details and project requirements. Put that same form in a new client portal with a welcome page and resources. Prepare a separate service agreement draft from the terms I provide, but don't send it."

## Execution

1. Reuse the user's existing intake form when requested; otherwise call Forms `create_form` with the supplied fields and intended workspace. Do not invent contact details or project terms. Keep the returned form ID and URL and verify readiness through Forms tools.
2. Call Apps `create_app` with a description including the exact form ID and URL, requested welcome/resources pages, and an instruction to embed that existing form rather than generate a replacement. For an existing portal, use Apps `edit_app` with its real app ID and these instructions.
3. Track app generation through Apps `fetch` when supported. Verify that the portal's form destination uses the original ID. If no evidence exposes the destination, report it as unverified and request inspection of the rendered preview. Keep the source form and portal instead of creating replacements.
4. If requested, call Sign `create_sign_document` with the user's agreement content. A service agreement is a separate document, not a conversion of the intake form. Do not infer terms, recipients, or authorization to use submissions. Missing agreement terms require clarification before that step, while independent authorized form/app work may continue.
5. If the user requested sending, inspect and configure the actual signer roles, verify readiness, then use Sign `send_for_signature` once. Preserve any returned sent-copy ID. If the user requested a draft only, finish with the draft.

## Observable success

- The intake form exists and is ready.
- The portal exists and reuses the exact form, with no duplicate created for embedding.
- A requested agreement is reported accurately as draft, pending, or sent, with no unsolicited invitation.
- The user receives actual results and the remaining incomplete step, if any.

This recipe does not create automatic lead routing, synchronize future submissions, or monitor signatures after the conversation.

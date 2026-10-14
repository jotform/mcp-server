---
name: jotform-workflows
description: Coordinate Jotform Forms, Jotform Apps, and Jotform Sign for a client onboarding or event management request involving multiple products. Use when a form must be reused in a portal or event app, optionally with a separate signing document.
---

# Jotform workflows

Use this skill for multi-product tasks. For a task that only needs one product, use that product's skill and avoid unrelated product suggestions.

## Pick the recipe

- Client intake, a client portal, and an optional service agreement: read [client onboarding](references/client-onboarding.md).
- Event registration, an event app, and optional consent: read [event management](references/event-management.md).

Also follow the product skill corresponding to each connector being used. In a host that supports named skills, use `jotform-forms`, `jotform-apps`, and `jotform-sign` under the Jotform plugin. Otherwise, load the corresponding bundled `../jotform-forms/SKILL.md`, `../jotform-apps/SKILL.md`, or `../jotform-sign/SKILL.md` as needed.

## Coordinate the steps

1. Identify the actual requested outcomes and already supplied details. Ask only for information needed to execute a step. A request to create an onboarding form alone is not a request to create an app or agreement.
2. Use the same intended Jotform account and workspace for shared assets. Connect products only as needed. A shared OAuth provider does not prove that the connections use the same account or give access to the same assets. If access fails, stop the dependent step and resolve the connection/workspace mismatch rather than copying data to work around it.
3. Keep a small conversation-level record of each completed step: connector, asset type, returned ID, returned user-facing URL, operation state, and verified relationship. This is temporary task context, not a new data store.
4. Wait for the source asset to be ready before a dependent operation. Resolve response envelopes from the actual result; never assume all products have the same shape.
5. Pass only verified identifiers and user-authorized content. Use the product-specific `search`, `fetch`, or status tool even when short names overlap. Never turn a form ID into an app or Sign ID.
6. Verify reuse of the exact source form in the app. Creating two assets is insufficient evidence that they are connected. A successful AI generation is not proof of the requested relationship.
7. Create a separate Sign document only when requested. Share only the relevant user-provided information; do not pull submission data into a contract unless the user authorized that use. Never auto-send, auto-sign, or expose personal signing links in an app.
8. On partial failure, report what exists and what remains incomplete, with the real identifiers needed to resume. Preserve completed assets. No rollback, deletion, repeated creation, or repeated email send without the relevant authorization and evidence.

## Finish

Report each requested outcome as completed, pending, failed, or unverified. Return actual previews and appropriate links. Do not mark a workflow complete while embedding or sending is unverified. These recipes run during the conversation; do not promise ongoing synchronization, automatic future triggers, or unattended status monitoring.

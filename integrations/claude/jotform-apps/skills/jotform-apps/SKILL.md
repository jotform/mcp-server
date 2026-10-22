---
name: jotform-apps
description: Find, create, display, or edit a client portal or event app. Use when the user wants a portal or app, or wants an existing registration, RSVP, or feedback form added to one.
---

# Jotform Apps

Use tools from the `jotform-apps` connector. Its `search` and `fetch` operate on apps. Do not use them for regular forms or Sign documents.

1. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.
2. For an existing app, use the `app_id` the user supplied or this connector's `search`. Use `fetch` for its details. Do not create a new app to satisfy an edit.
3. Use `create_app` with `description` for a new app. State the pages, purpose, and content the user supplied. Use `edit_app` with `app_id` and `instructions` for a change. Do not add a `form_id` argument the schema does not define.
4. To embed an existing form, put its verified ID and returned URL in `description` or `instructions`, and say to reuse that form rather than create a replacement. Include only content the user authorized for the app. Keep private submissions, contracts, and personal signing links out of app content.
5. For `create_app`, personal workspace uses `workspace_type: "personal"` and `team_id: null`. A team workspace needs the numeric ID from this connector's `get_teams` and `workspace_type: "team"`. Do not copy the empty-string team ID used by the forms connector. Apply workspace arguments on other tools only when the live schema has them.
6. For a `processing` response, keep the returned app ID (including `related_asset.asset_id` when present) and call this connector's `fetch`. If `metadata.build_status` is `processing`, wait for `metadata.poll_after_seconds` when it is present. Stop on completion, failure, or a confirmation question. If timing or status is missing, report the app as pending. Do not call creation or editing again to poll.
7. Confirm the requested outcome from the returned app details and the rendered preview. If those results do not show the embedded form ID, say reuse is unverified and ask the user to check the form in the preview. If a duplicate form appeared, report it. Do not delete assets or start another app to compensate.

Apply only the changes the user asked for, and leave unrelated pages in place. Do not infer that an app is published from a successful draft. Report the sharing state and URL the service returns.

After an uncertain response or timeout, inspect the existing app before retrying a write. If authentication or permissions fail, keep the known app and name the step that failed. Finish with a short summary and a verified link or preview.

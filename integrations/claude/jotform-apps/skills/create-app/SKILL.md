---
name: create-app
description: Create a new app or client portal, such as an event app or a customer portal with pages, content and the user's forms, from a description. Use when the user wants a new app or portal. Not for changing an app they already have (edit-app).
metadata:
  version: "850e2e279688"
---

# Create an app

Use tools from the `jotform` connector. Its `search` and `fetch` can also cover forms and Sign documents, so pass `product_type: ["portal"]` to `search` and use them only for apps. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Use `create_app` with `description`. State the pages, purpose, and content the user supplied. Do not add a `form_id` argument the schema does not define.
2. To embed an existing form, put its verified ID and returned URL in the request, and say to reuse that form rather than create a replacement. Include only content the user authorized for the app. Keep private submissions, contracts, and personal signing links out of app content.
3. Personal workspace uses `workspace_type: "personal"` and `team_id: null`. A team workspace needs the numeric ID from this connector's `get_teams` and `workspace_type: "team"`. Do not copy the empty-string team ID used by the forms connector. Apply workspace arguments on other tools only when the live schema has them.
4. For a `processing` response, keep the returned app ID (including `related_asset.asset_id` when present) and call this connector's `fetch`. If `metadata.build_status` is `processing`, wait for `metadata.poll_after_seconds` when it is present. Stop on completion, failure, or a confirmation question. If timing or status is missing, report the app as pending. Do not call creation or editing again to poll.
5. Confirm the requested outcome from the returned app details and the rendered preview. If those results do not show the embedded form ID, say reuse is unverified and ask the user to check the form in the preview. If a duplicate form appeared, report it. Do not delete assets or start another app to compensate.

After an uncertain response or timeout, inspect the existing app before retrying a write. If authentication or permissions fail, keep the known app and name the step that failed.

## Reply

Finish with a short summary and a verified link or preview. Do not infer that an app is published from a successful draft. Report the sharing state and URL the service returns.

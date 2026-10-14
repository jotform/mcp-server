---
name: jotform-apps
description: Find, create, display, or edit Jotform Apps and portals. Use for client portals, event apps, pages, resources, or adding an existing Jotform form to an app.
---

# Jotform Apps

Use tools from the `jotform-apps` connector at `https://mcp.jotform.com/mcp-jotform-apps-v1`. Its `search` and `fetch` operate on apps; do not use them to retrieve regular forms or Sign documents.

1. Check the live tool definitions and connection. Explain a missing connection or permission; never request a password or token in chat.
2. For an existing app, use a supplied `app_id` or this connector's `search` to resolve the intended asset. Use `fetch` for its details. Do not create a new app to satisfy an edit request.
3. Use `create_app` with `description` for a new app. Specify the intended pages, purpose, and supplied content. Use `edit_app` with `app_id` and `instructions` for a change. Do not add an invented `form_id` parameter to either tool.
4. When embedding an existing form, include its verified ID and returned URL in `description` or `instructions`. Explicitly request reuse of that exact form and no replacement form. Include only relevant data the user authorized for that destination. Keep private submissions, contracts, and personal signing links out of public app content.
5. Apply workspace arguments only when the current schema exposes them. If a named team must be resolved, use this connector's `get_teams`. For the existing enterprise `create_app` schema, personal `team_id` is null; do not copy the Forms connector's empty-string default. Check the current schema before executing.
6. For a `processing` response, keep the returned app ID (including `related_asset.asset_id` where present) and call this connector's `fetch`. If `metadata.build_status` is `processing`, respect a valid `metadata.poll_after_seconds`. Stop at completion, failure, or a request for confirmation. Missing timing or status fields are a reason to report pending/uncertain state rather than loop rapidly. Never repeat creation or editing to poll.
7. Verify the requested outcome through returned app details and the actual rendered preview. If the embedded form ID is not visible in the available evidence, state that reuse is unverified and ask the user to inspect the form destination in the preview. Do not mark the cross-product workflow complete until this is verified. If a duplicate form appeared, report it; do not silently delete assets or start another app.

Changes may replace or remove app content. Apply only requested modifications and preserve unrelated pages. Do not infer publication or public accessibility from a successful draft creation; report only the sharing state and URL the service actually returns.

On an uncertain response or timeout, inspect the existing app before retrying a write. If permissions or authentication fail, preserve the known app and identify the affected step. Finish with a short summary and a verified user-facing link or preview; offer another product only when it advances the user's requested task.

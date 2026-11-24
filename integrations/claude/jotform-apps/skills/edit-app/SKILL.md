---
name: edit-app
description: Change an existing app or portal, such as adding, removing or rearranging pages, content, styling or settings, or adding one of the user's forms to it. Use when the user wants something changed in an app they already have. Not for a new app (create-app).
metadata:
  version: "209be3b40477"
---

# Edit an app

Use tools from the `jotform` connector. Its `search` and `fetch` can also cover forms and Sign documents, so pass `product_type: ["portal"]` to `search` and use them only for apps. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Find the app: use the `app_id` the user supplied or this connector's `search`, and `fetch` for its details. Ask which app they mean only when more than one match is plausible. If no app matches the name the user gave, say so and ask; do not act on a different app instead. Do not create a new app to satisfy an edit.
2. Use `edit_app` with `app_id` and `instructions` for the change. Apply only the changes the user asked for, and leave unrelated pages in place.
3. To embed an existing form, put its verified ID and returned URL in the request, and say to reuse that form rather than create a replacement. Include only content the user authorized for the app. Keep private submissions, contracts, and personal signing links out of app content.
4. For a `processing` response, keep the returned app ID (including `related_asset.asset_id` when present) and call this connector's `fetch`. If `metadata.build_status` is `processing`, wait for `metadata.poll_after_seconds` when it is present. Stop on completion, failure, or a confirmation question. If timing or status is missing, report the app as pending. Do not call creation or editing again to poll.
5. Confirm the requested outcome from the returned app details and the rendered preview. If those results do not show the embedded form ID, say reuse is unverified and ask the user to check the form in the preview. If a duplicate form appeared, report it. Do not delete assets or start another app to compensate.

After an uncertain response or timeout, inspect the existing app before retrying a write. If authentication or permissions fail, keep the known app and name the step that failed.

## Reply

Finish with a short summary and a verified link or preview. Do not infer that an app is published from a successful draft. Report the sharing state and URL the service returns.

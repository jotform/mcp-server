---
name: display-app
description: Show an existing app or portal, or give its link and sharing state. Use when the user asks to see, open or share an app, or wants its link. Not for finding or listing apps (list-apps) or changing one (edit-app).
---

# Display or share an app

Use tools from the `jotform` connector. Its `search` and `fetch` can also cover forms and Sign documents, so pass `product_type: ["portal"]` to `search` and use them only for apps. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Find the app: use the `app_id` the user supplied or this connector's `search`, and `fetch` for its details. Ask which app they mean only when more than one match is plausible. If no app matches the name the user gave, say so and ask; do not act on a different app instead.
2. When the connector has `display_app`, use it to show the app. Otherwise give the link that `search` or `fetch` returned.
3. Do not infer that an app is published from a successful draft. Report the sharing state and URL the service returns, and do not build a URL from a guessed ID.

## Reply

Keep the reply short: the link or the rendered app.

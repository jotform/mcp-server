---
name: list-apps
description: Find or list the user's apps and portals by name. Use when the user asks which apps they have or looks for an app. Not for showing one app (display-app) or changing it (edit-app).
metadata:
  version: "eb98d7494a33"
---

# Find and list apps

Use tools from the `jotform` connector. Its `search` and `fetch` can also cover forms and Sign documents, so pass `product_type: ["portal"]` to `search` and use them only for apps. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Use this connector's `search` with the user's terms, and answer from its results.
2. When the user wants to act on one app and more than one match is plausible, ask which one. If nothing matches, say so.

## Reply

Keep the reply short and do not repeat the whole list unless the user asks.

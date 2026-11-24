---
name: list-submissions
description: Show the responses a form received, such as the latest entries or the ones from a date range. Use when the user wants to see or read individual submissions. For counts, averages, trends or a summary of the answers, use analyze-submissions.
---

# List a form's submissions

Use tools from the `jotform` connector. When another connector exposes the same short tool name, choose the tool that belongs to `jotform`. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Find the form: use the form ID the user supplied or this connector's `search`. Ask which form they mean only when more than one match is plausible. If no form matches the name the user gave, say so and ask; do not act on a different form instead.
2. Call `list_submissions` with the form ID and any range or filter the live schema offers. Use `fetch` for the form's details when needed.
3. When the user asks how many, how often, an average, a trend or a summary, use `analyze_submissions` instead; do not count or compute from the listing yourself.

## Reply

Keep the reply short and answer from what the tool returned.

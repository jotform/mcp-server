---
name: analyze-submissions
description: Answer questions about what people answered on a form, such as counts, averages, ratings, trends, common themes or a summary, including this week's responses. Use when the user asks how many, how often, what most people said, or for a report on a form's responses. To read individual responses, use list-submissions.
---

# Analyze a form's submissions

Use tools from the `jotform` connector. When another connector exposes the same short tool name, choose the tool that belongs to `jotform`. Treat the connected server's current tool definitions as the contract. If the connector is unavailable, name the connection the user needs. Never ask for a password or token in chat.

1. Find the form: use the form ID the user supplied or this connector's `search`. Ask which form they mean only when more than one match is plausible. If no form matches the name the user gave, say so and ask; do not act on a different form instead.
2. Call `analyze_submissions` with the form ID and the user's question, including any time range.
3. Answer from the analysis the tool returned. Do not compute counts, averages or trends yourself from a listing, and do not list raw responses instead of answering.

## Reply

Give the answer with the numbers from the analysis, short.

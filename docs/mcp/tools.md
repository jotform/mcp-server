# What each server can do

You do not call these tools yourself. Ask in plain words, and your AI tool picks the right tool.

Jotform MCP is free. Your Jotform plan limits still apply.

## Main server

Address: `https://mcp.jotform.com`. The Gemini extension's `/default` address has the same tools.

| Tool | What it does |
| --- | --- |
| `search` | Finds forms and apps. |
| `create_form` | Creates a form from your description. |
| `edit_form` | Changes a form. |
| `fetch` | Reads one form or response. |
| `get_submissions` | Lists the responses of a form. |
| `assign_form` | Sends a form to someone by email. |
| `analyze_submissions` | Summarizes responses and finds patterns. |

## Forms app

Address: `https://mcp.jotform.com/mcp-app`. It has the main server's tools, except `get_submissions`. It also has these tools:

| Tool | What it does |
| --- | --- |
| `display_form` | Shows a form preview. |
| `list_submissions` | Shows responses in a table. |
| `create_submission` | Adds a response to a form. |
| `get_embed_code` | Gives the HTML to put a form on a website. |
| `get_teams` | Lists your Enterprise teams. |

## Sign app

Address: `https://mcp.jotform.com/mcp-sign-v1`.

| Task | Tools |
| --- | --- |
| Find documents and see signing activity | `search`, `list_submissions` |
| Create, edit, or preview a document | `create_sign_document`, `edit_sign_document`, `display_sign_document`, `update_sign_document_content` |
| See and change signers | `get_signers`, `update_signer` |
| Send for signature and check progress | `send_for_signature`, `get_signing_status`, `get_signing_links` |
| List your Enterprise teams | `get_teams` |

## Apps app

Address: `https://mcp.jotform.com/mcp-jotform-apps-v1`.

| Task | Tools |
| --- | --- |
| Find an app and read it | `search`, `fetch` |
| Create or change an app | `create_app`, `edit_app` |
| List your Enterprise teams | `get_teams` |

## Same name, different server

Some tools have the same name on more than one server. For example, `search` finds forms and apps on the main server, documents on the Sign app, and apps on the Apps app. Each tool works on its own server's product.

## For developers

Your AI tool shows the current tool list after you connect. You can also call MCP's [`tools/list` method](https://modelcontextprotocol.io/specification/2025-06-18/server/tools). Always use the schema from the server you are connected to.

Official docs: [main server](https://www.jotform.com/developers/mcp/?tab=mcp) · [MCP Apps](https://www.jotform.com/developers/mcp/?tab=mcp-app)

[Server addresses](endpoints.md) · [Sign-in and access](authentication.md) · [Back to start](../../README.md)

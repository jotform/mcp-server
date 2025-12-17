# Jotform MCP Server

A **Model Context Protocol (MCP) server for Jotform**. This integration exposes **Jotform Forms** and **Submissions** to any **MCP-compatible client** via a hosted endpoint. It follows the **Model Context Protocol** spec for interoperability.

The service is actively optimized based on real-world usage and **more tools are coming soon**.

---

## Remote server URL

```
https://mcp.jotform.com
```

Point any MCP-enabled client to this address to begin.

---

## Example usage

Ask your AI assistant to:

- 🗂️ **List Forms** — “List all active forms created this month.”
- 📄 **Query Submissions** — “Show submissions for form 123 where Status is Pending.”
- 💻 **Create a Form** — “Create a new feedback form for me to collect customer feedback.”
- ⌨️ **Edit a Form** — “Rename form 123 to ‘NPS Survey (Q4)’.”
- 📬 **Create Submission** — “Add a new submission to form 123 with Name=Jane Doe.”

---

## Compatibility

| Product | Deployment type | Support status |
|---|---|---|
| Jotform | Cloud (hosted endpoint) | ✅ Fully supported via `https://mcp.jotform.com` |

---

## Quick start guide

### 🔐 1) Authentication setup (OAuth 2.0)

Jotform MCP requires **OAuth for every user on first connect**. Bearer-token access is not supported.

- Add the server URL in your MCP client.
- You’ll be shown a Jotform **OAuth consent screen** to authorize access to your Jotform data.
- Only **workspace admins** can install the Jotform MCP app.

#### View authorized MCP clients

1. Sign in to **Jotform Dashboard**
2. **My Account → Connected Apps**
3. Select **Jotform MCP**
4. Open **Clients** to see all OAuth-connected MCP clients

#### Revoke OAuth access for a specific client

1. In **Clients**, find the target client
2. Click the overflow menu (**⋮**)
3. Choose **Revoke** — access is removed immediately

> Note: OAuth 2.0 is required for all connections.

---

### 📦 2) Installation

- **No server install needed.**
- Use the hosted endpoint: `https://mcp.jotform.com`
- Add the URL in your MCP-capable client and authorize.

---

## 🛠️ IDE integration

Jotform MCP integrates with IDEs, allowing direct use through AI assistants.

### Cursor

`Settings → MCP Servers → Add → paste URL → Authorize`

### VS Code extension

`Command Palette → “MCP: Add Server” → paste URL → Authorize`

### Others

More clients coming soon.

> No extra configuration is needed after approval.

---

## Configuration

### ⚙️ Configuration methods

Configuration options are minimal — **only OAuth setup is required**.

### 📝 Configuration examples

No manual configuration needed; just connect and authorize.

---

## 👥 HTTP transport configuration

The server communicates over **HTTPS** using standard MCP client-server interactions.

---

## Tools

### Key tools

- `form_list`: Get the list of your forms
- `create_form`: Create a new form
- `edit_form`: Edit an existing form
- `create_submission`: Make a submission to an existing form
- `get_submissions`: Get all submissions of a form

This MCP is actively maintained, and **more tools will come soon**.

### Tool filtering & access control

Access control is managed via **OAuth scopes**. Only explicitly granted scopes are available to the client.

---

## Troubleshooting & debugging

### Rate limits

Rate limits ( same per-user as the Jotform REST API):

| Plan | Requests per minute |
|---|---:|
| Free | 60 |
| Enterprise | 600 |

- If limits are exceeded, the server returns **HTTP 429** with a `Retry-After` header.
- Ensure you complete the OAuth flow; **bearer tokens are not accepted**.

---

## Security

- **OAuth 2.0 required** for all connections
- **Bearer-token access is not supported**
- Manage and revoke client access via: **Account → Connected Apps → Jotform MCP → Clients**

---

## Contributing

Follow GitHub discussions or contact the Jotform support team for early access opportunities and updates on the timeline.

---

## License

Details will be published with the open-source release.

---

## Support

- Email: `support@jotform.com` (CC: `mcp@jotform.com`)
- Support Inbox: https://www.jotform.com/answers (use tag **MCP**)
- [Feedback Form](https://form.jotform.com/252370136225045): Share feature requests — your feedback drives the roadmap.

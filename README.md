# Jotform MCP Server

A Model Context Protocol (MCP) server for Jotform. This integration exposes Jotform Forms and Submissions to any MCP-compatible client via a hosted endpoint. It follows the Model Context Protocol spec for interoperability.

The service is actively optimized based on real-world usage and more tools are coming soon.

## Remote Server URL

```
https://mcp.jotform.com
```

Point any MCP-enabled client to this address to begin.

## Example Usage

Ask your AI assistant to:

- 🗂️ **List Forms** — "List all active forms created this month."
- 📄 **Query Submissions** — "Show submissions for form 123 where Status is Pending."
- 💻 **Create a Form** — "Create a new feedback form for me to collect customer feedback."
- ⌨️ **Edit a Form** — "Rename form 123 to 'NPS Survey (Q4)'."
- 📬 **Create Submission** — "Add a new submission to form 123 with Name=Jane Doe."

## Compatibility

| Product | Deployment type | Support status |
|---------|----------------|----------------|
| Jotform | Cloud (hosted endpoint) | ✅ Fully supported via https://mcp.jotform.com |

## Quick Start Guide

### For Gemini CLI

To get started with Gemini CLI, you can use the official Gemini CLI extension for Jotform.

To install the extension, run the following command in your terminal:

```bash
gemini extensions install https://github.com/jotform/mcp-server
```

Once you have the extension installed, start Gemini CLI by running:

```bash
gemini
```

Then, authenticate with your Jotform account by running the following command inside Gemini CLI:

```
/mcp auth jotform
```

This will open a browser window to complete the OAuth authentication process. After authenticating, all the Jotform tools will be available.

A few example prompts to try:

```
/jotform:create-form contact form with name, email, and message
/jotform:list-forms
/jotform:get-submissions 123456789
```

### 🔐 1) Authentication Setup (OAuth 2.0)

Jotform MCP requires OAuth for every user on first connect. Bearer-token access is not supported.

1. Add the server URL in your MCP client
2. You'll be shown a Jotform OAuth consent screen to authorize access to your Jotform data
3. Only workspace admins can install the Jotform MCP app

#### View Authorized MCP Clients

1. Sign in to Jotform Dashboard
2. My Account → Connected Apps
3. Select Jotform MCP
4. Open Clients to see all OAuth-connected MCP clients

#### Revoke OAuth Access for a Specific Client

1. In Clients, find the target client
2. Click the overflow menu (⋮)
3. Choose Revoke — access is removed immediately

**Note:** OAuth 2.0 is required for all connections.

### 📦 2) Installation

No server install needed.

- Use the hosted endpoint: `https://mcp.jotform.com`
- Add the URL in your MCP-capable client and authorize

## 🛠️ IDE Integration

### Gemini CLI

```bash
# Install extension
gemini extensions install https://github.com/jotform/mcp-server

# Start and authenticate
gemini
/mcp auth jotform
```

### Cursor IDE

Settings → MCP Servers → Add:

```json
{
  "mcpServers": {
    "jotform": {
      "url": "https://mcp.jotform.com"
    }
  }
}
```

### Claude Desktop

Add to your configuration:

```json
{
  "mcpServers": {
    "jotform": {
      "url": "https://mcp.jotform.com"
    }
  }
}
```

### VS Code Extension

Command Palette → "MCP: Add Server" → paste URL → Authorize

No extra configuration is needed after approval.

## Configuration

### ⚙️ Configuration Methods

Configuration options are minimal — only OAuth setup is required.

### 👥 HTTP Transport Configuration

The server communicates over HTTPS using standard MCP client-server interactions.

## Tools

### Key Tools

- `list_forms` - Get the list of your forms
- `create_form` - Create a new form
- `edit_form` - Edit an existing form
- `create_submission` - Make a submission to an existing form
- `get_submissions` - Get all submissions of a form
- `assign_form` - Assign form to user

This MCP is actively maintained, and more tools will come soon.

### Tool Filtering & Access Control

Access control is managed via OAuth scopes. Only explicitly granted scopes are available to the client.

## Troubleshooting & Debugging

### Rate Limits

Rate limits (same per-user as the Jotform REST API):

| Plan | Requests per minute |
|------|---------------------|
| Free | 60 |
| Enterprise | 600 |

If limits are exceeded, the server returns HTTP 429 with a Retry-After header.

**Important:** Ensure you complete the OAuth flow; bearer tokens are not accepted.

## Security

- OAuth 2.0 required for all connections
- Bearer-token access is not supported
- Manage and revoke client access via: Account → Connected Apps → Jotform MCP → Clients

## Contributing

Follow GitHub discussions or contact the Jotform support team for early access opportunities and updates on the timeline.

## License

MIT

## Support

- **Email**: support@jotform.com (CC: mcp@jotform.com)
- **Support Inbox**: https://www.jotform.com/answers (use tag MCP)
- **Feedback Form**: Share feature requests — your feedback drives the roadmap

# Server addresses

Jotform has one main MCP server and three product servers. Most people only need the main server. The Claude plugins add the product servers for you.

| Server | Address | Use it for | Used by |
| --- | --- | --- | --- |
| Main server | `https://mcp.jotform.com` | Forms and responses, as text | [Server address guide](../server-address.md), [Gemini extension](../../gemini-extension.json) |
| Forms app | `https://mcp.jotform.com/mcp-app` | Forms and responses, with previews and tables | [Form Creator plugin](../../integrations/claude/form-creator/.mcp.json) |
| Sign app | `https://mcp.jotform.com/mcp-sign-v1` | Documents for signature | [Jotform Sign plugin](../../integrations/claude/jotform-sign/.mcp.json) |
| Apps app | `https://mcp.jotform.com/mcp-jotform-apps-v1` | Client portals and event apps | [Jotform Apps plugin](../../integrations/claude/jotform-apps/.mcp.json) |

The Gemini extension uses `https://mcp.jotform.com/default`. This is the same main server.

## What your tool needs

Your tool must support remote HTTP MCP servers and browser sign-in. Previews and tables only show in tools that support MCP Apps.

Official docs: [main server](https://www.jotform.com/developers/mcp/?tab=mcp) · [MCP Apps](https://www.jotform.com/developers/mcp/?tab=mcp-app)

[What each server can do](tools.md) · [Sign-in and access](authentication.md) · [Back to start](../../README.md)

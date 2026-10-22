# Server address

Use this guide if your AI tool can add a remote MCP server. You add our address and sign in to Jotform. You get forms and responses.

Our server address is:

```text
https://mcp.jotform.com
```

## Codex

1. Run these commands in your terminal:

   ```sh
   codex mcp add jotform --url https://mcp.jotform.com
   codex mcp login jotform
   ```

2. Sign in to Jotform in your browser.
3. Start Codex with `codex`. Type `/mcp` to see the connection.

You can also add the server in the Codex settings. Use the name `jotform` and the address above. See the [Codex MCP guide](https://learn.chatgpt.com/docs/extend/mcp?surface=cli).

## Cursor

1. Add this to `.cursor/mcp.json` in your project. If the file already has `mcpServers`, add only the `jotform` entry.

   ```json
   {
     "mcpServers": {
       "jotform": {
         "url": "https://mcp.jotform.com"
       }
     }
   }
   ```

2. Open Cursor's MCP settings and sign in to `jotform`.

## VS Code

1. Run **MCP: Add Server** from the Command Palette.
2. Choose **HTTP** and enter `https://mcp.jotform.com`.
3. Name the server `jotform`.
4. Run **MCP: List Servers**, choose `jotform`, and sign in.

Or add this to `.vscode/mcp.json`. If the file already has `servers`, add only the `jotform` entry.

```json
{
  "servers": {
    "jotform": {
      "type": "http",
      "url": "https://mcp.jotform.com"
    }
  }
}
```

## Any other MCP tool

Add `https://mcp.jotform.com` as a remote HTTP MCP server. Sign in to Jotform when the tool asks.

## Check that it works

Ask your AI tool:

> Find my forms.

## Problems

| Problem | What to do |
| --- | --- |
| No Jotform tools | Check that the server is on. Finish signing in. In Codex, run `codex mcp list`. |
| You are asked to sign in | Sign in again from your tool's MCP settings. In Codex, run `codex mcp login jotform`. |
| You see the wrong forms | Sign in with the right Jotform account. |

Tool docs: [Codex](https://learn.chatgpt.com/docs/extend/mcp?surface=cli) · [Cursor](https://cursor.com/docs/mcp) · [VS Code](https://code.visualstudio.com/docs/agent-customization/mcp-servers)

[What each server can do](mcp/tools.md) · [Sign-in and access](mcp/authentication.md) · [Back to start](../README.md)

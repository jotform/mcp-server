# Jotform Apps for Claude

Use Jotform Apps in Claude. Build client portals and event apps, and add your forms to them.

## Install

```sh
claude plugin marketplace add jotform/mcp-server
claude plugin install jotform-apps@jotform-plugins
```

For claude.ai and Cowork, follow the [Claude plugins guide](https://github.com/jotform/mcp-server/blob/master/docs/claude-plugins.md).

To create new forms for your app, also install the [Jotform plugin](https://github.com/jotform/mcp-server/blob/master/integrations/claude/jotform/README.md).

## Things to try

- "Create a client portal with a welcome page and my contact form."
- "Add a schedule page to my workshop app."
- "Show me my event app."

## What is inside

| Part | What it does |
| --- | --- |
| `jotform-apps` connection | Connects to `https://mcp.jotform.com/mcp-jotform-apps-v1`. |
| [`jotform-apps`](skills/jotform-apps/SKILL.md) skill | Builds and changes client portals and event apps. |

## Your data

The plugin connects Claude to Jotform's servers. Your apps stay in your Jotform account. Your account controls sign-in and permissions.

- Website: [Jotform Apps](https://www.jotform.com/products/apps/)
- Support: [Jotform Support](https://www.jotform.com/answers/)
- Privacy: [Jotform Privacy Policy](https://www.jotform.com/privacy/)
- Terms: [Jotform Terms](https://www.jotform.com/terms/)
- Source: [jotform/mcp-server](https://github.com/jotform/mcp-server)

## License

MIT. See the repository's [LICENSE](https://github.com/jotform/mcp-server/blob/master/LICENSE).

# Form Creator for Claude

Use Jotform forms in Claude. Create forms, preview them, and read the responses.

Want documents for signature or apps? Install [Jotform Sign](https://github.com/jotform/mcp-server/blob/master/integrations/claude/jotform-sign/README.md) or [Jotform Apps](https://github.com/jotform/mcp-server/blob/master/integrations/claude/jotform-apps/README.md) too.

## Install

```sh
claude plugin marketplace add jotform/mcp-server
claude plugin install form-creator@jotform-plugins
```

For claude.ai and Cowork, follow the [Claude plugins guide](https://github.com/jotform/mcp-server/blob/master/docs/claude-plugins.md).

## Things to try

- "Create a customer feedback form with a rating and an optional comment."
- "Add a phone number field to my registration form."
- "What did people answer on my feedback form this week?"

## What is inside

| Part | What it does |
| --- | --- |
| `jotform` connection | Connects to `https://mcp.jotform.com/mcp-app`. |
| [`jotform-forms`](skills/jotform-forms/SKILL.md) skill | Creates and edits forms. Reads responses. |

## Your data

The plugin connects Claude to Jotform's servers. Your forms and responses stay in your Jotform account. Your account controls sign-in and permissions.

- Website: [Jotform](https://www.jotform.com)
- Support: [Jotform Support](https://www.jotform.com/answers/)
- Privacy: [Jotform Privacy Policy](https://www.jotform.com/privacy/)
- Terms: [Jotform Terms](https://www.jotform.com/terms/)
- Source: [jotform/mcp-server](https://github.com/jotform/mcp-server)

## License

MIT. See the repository's [LICENSE](https://github.com/jotform/mcp-server/blob/master/LICENSE).

# Jotform Sign for Claude

Use Jotform Sign in Claude. Prepare documents, set the signers, send them for signature, and see who has signed.

## Install

```sh
claude plugin marketplace add jotform/mcp-server
claude plugin install jotform-sign@jotform-plugins
```

For claude.ai and Cowork, follow the [Claude plugins guide](https://github.com/jotform/mcp-server/blob/master/docs/claude-plugins.md).

## Things to try

- "Prepare a service agreement draft using these terms."
- "Add Jane as a signer on my NDA."
- "Who has signed my consent document?"

## What is inside

| Part | What it does |
| --- | --- |
| `jotform-sign` connection | Connects to `https://mcp.jotform.com/mcp-sign-v1`. |
| [`jotform-sign`](skills/jotform-sign/SKILL.md) skill | Prepares documents for signature. Tracks signatures. |

## Your data

The plugin connects Claude to Jotform's servers. Your documents stay in your Jotform account. Your account controls sign-in and permissions.

- Website: [Jotform Sign](https://www.jotform.com/products/sign/)
- Support: [Jotform Support](https://www.jotform.com/answers/)
- Privacy: [Jotform Privacy Policy](https://www.jotform.com/privacy/)
- Terms: [Jotform Terms](https://www.jotform.com/terms/)
- Source: [jotform/mcp-server](https://github.com/jotform/mcp-server)

## License

MIT. See the repository's [LICENSE](https://github.com/jotform/mcp-server/blob/master/LICENSE).

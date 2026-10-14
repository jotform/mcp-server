# Jotform for Claude

Create and manage forms, prepare documents for signature, and build Jotform Apps from a conversation. This pilot plugin brings the three existing Jotform connectors together with instructions for using them separately or in a client onboarding or event management workflow.

## Connect your account

Install the plugin, then connect the products you need from its Connectors tab. Each product uses its existing Jotform OAuth flow. A current Jotform browser session and an existing consent may be reused; the plugin does not automatically connect all three products or promise a single authorization screen. Use the same Jotform account and intended workspace for steps that share assets.

| Connector | Hosted endpoint |
| --- | --- |
| Jotform | `https://mcp.jotform.com/mcp-app` |
| Jotform Sign | `https://mcp.jotform.com/mcp-sign-v1` |
| Jotform Apps | `https://mcp.jotform.com/mcp-jotform-apps-v1` |

If you already use a Jotform connector, keep its existing connection. The plugin uses the same endpoint rather than creating a replacement service. On Team or Enterprise, organization connector settings may require an owner to make a connector available before members connect their accounts.

## Try it

- "Create a customer feedback form with a rating and an optional comment."
- "Create a client onboarding form and add that same form to a new client portal. Prepare a separate service agreement draft, but don't send it."
- "Create a workshop registration form and an event app containing that same form, the schedule, and venue details."

The plugin includes four skills: `jotform-forms`, `jotform-sign`, `jotform-apps`, and `jotform-workflows`. The workflow skill contains client onboarding and event management recipes. Sign documents are separate assets; the plugin does not automatically convert a form into a signing document. Invitation emails are sent only when requested. Signing itself happens through Jotform's signing experience, not through a claim that Claude signed for you.

## Install

For a pilot on Claude web or Cowork, upload the ZIP through **Customize > Plugins > Add > Upload plugin**, then connect the needed products. The ZIP contains one `jotform/` folder, with `.claude-plugin/plugin.json` directly inside it.

For Claude Code, from a checkout of this repository:

```sh
claude --plugin-dir ./plugins/jotform
```

Check the connections with `/mcp`. Skills appear under the `jotform` plugin namespace. Local loading does not publish or install the plugin for anyone else.

## Data and support

The package contains Markdown instructions and JSON connection definitions, with no local server, executable hooks, credentials, or analytics collector. Calls use the declared Jotform services; authentication, account permissions, stored assets, and hosted widget resources are handled by those services. Requests and asset data are subject to the existing Jotform services' data practices. A multi-product request passes relevant returned asset identifiers, URLs, and user-authorized content between those services.

- Website: [Jotform](https://www.jotform.com)
- Support: [Jotform Support](https://www.jotform.com/answers/)
- Privacy: [Jotform Privacy Policy](https://www.jotform.com/privacy/)
- Terms: [Jotform Terms](https://www.jotform.com/terms/)
- Source: [jotform/mcp-server](https://github.com/jotform/mcp-server)

Version `0.1.0` is a pilot package. Authenticated host tests and directory review must be completed before public release. Product capabilities and accepted arguments come from each connected server's current tool definitions. A missing capability or permission must be reported instead of inventing a successful result.

## License

MIT; see [LICENSE](LICENSE). The package's license does not change the hosted products' terms.

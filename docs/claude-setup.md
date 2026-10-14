# Claude pilot setup

## Build the ZIP

From the repository root, with Python 3 and Claude Code installed:

```sh
python3 scripts/package-claude-plugin.py
```

This uses Claude Code's strict validator for the plugin and marketplace, creates `dist/jotform-claude-0.1.0.zip`, then extracts and validates the exported plugin. It uses only Python's standard library and contains no product build or deployment step. The ZIP includes hidden manifest files and excludes the repository's Gemini extension, maintenance scripts, CI, and internal rollout documents.

## Claude web and Cowork

1. In your pilot account, open **Customize > Plugins > Add > Upload plugin** and upload the ZIP.
2. Open the plugin's Connectors tab and connect only the products needed for the test. Each uses the existing Jotform OAuth flow. Team/Enterprise owners may need to make the connectors available to members.
3. Use the same test Jotform account and intended workspace for cross-product tests. A browser login session or consent may be reused, but three entries are three connections. Do not assume shared account identity, token reuse, or independent revocation behavior.
4. Open a new conversation and confirm the four Jotform skills are available. Run the cases in [pilot validation](pilot-validation.md). Test web and Cowork separately.

Existing directory connectors should keep their exact URLs. Verify that adding the plugin does not duplicate tools or require replacing an existing connection. Do not remove working connections just to install this plugin.

## Claude Code

Load the working copy without changing user installation settings:

```sh
claude --plugin-dir ./plugins/jotform
```

Use `/mcp` to inspect and authenticate the connections. Invoke a product skill such as `/jotform:jotform-forms`, or ask for a supported workflow. Claude Code skill discovery and connection checks do not prove web/Cowork widget compatibility.

To test marketplace installation in a disposable Claude configuration:

```sh
export CLAUDE_CONFIG_DIR="$(mktemp -d)"
claude plugin marketplace add .
claude plugin install jotform@jotform-plugins
claude plugin list
```

After a release has actually been merged/pushed to the public repository, testers may add `https://github.com/jotform/mcp-server` through **Add marketplace** or use the same URL with `claude plugin marketplace add`. Before then, use the ZIP or working copy; the upstream URL does not include unmerged local changes.

## Troubleshooting

- Missing product: connect that product; plugin installation alone is not OAuth authorization.
- Wrong asset or permission error: check account, workspace, and the connector used by the call. Shared OAuth hosting does not guarantee access to an asset.
- Pending creation: use the product's documented status path, not a second creation.
- Missing widget: check the host, resource discovery, and CSP errors. Record the result; this package does not modify the hosted UI.
- Duplicate tools: record the exact connector URLs and how each was installed. Preserve the current working connection and investigate before rollout.
- Disconnect/revoke: test with dedicated accounts. Shared OAuth client consent can affect more than one connection; disabling a plugin is different from revoking Jotform access.

## References

- [Claude plugin structure and testing](https://claude.com/docs/plugins/build)
- [Create a marketplace](https://code.claude.com/docs/en/plugin-marketplaces)
- [Submit a plugin](https://claude.com/docs/plugins/submit)

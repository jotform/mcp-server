# Claude plugins

The Jotform plugins work in Claude Code, claude.ai, and Cowork. There is one plugin for each product. Install only the ones you need.

| Plugin | Use it for | Install ID | Skill |
| --- | --- | --- | --- |
| Jotform | Forms and responses | `jotform@jotform-plugins` | `/jotform:jotform-forms` |
| Jotform Sign | Documents for signature | `jotform-sign@jotform-plugins` | `/jotform-sign:jotform-sign` |
| Jotform Apps | Client portals and event apps | `jotform-apps@jotform-plugins` | `/jotform-apps:jotform-apps` |

To put a new form in an app, install Jotform and Jotform Apps.

Only want forms on claude.ai, without a plugin? Use the [app directory](app-directory.md).

## Claude Code

1. Add the marketplace:

   ```sh
   claude plugin marketplace add jotform/mcp-server
   ```

2. Install the plugins you want:

   ```sh
   claude plugin install jotform@jotform-plugins
   claude plugin install jotform-sign@jotform-plugins
   claude plugin install jotform-apps@jotform-plugins
   ```

3. Start Claude Code with `claude`.
4. Type `/mcp`. Choose each Jotform connection and sign in to Jotform in your browser.

## claude.ai and Cowork

1. Open **Customize > Plugins > Add > Add marketplace**.
2. Enter `https://github.com/jotform/mcp-server`.
3. Install **Jotform**, **Jotform Sign**, or **Jotform Apps**.
4. Open each plugin's **Connectors** tab and connect it.
5. Sign in to Jotform.

On Team and Enterprise plans, an owner may need to turn on the plugins first.

Sign in with the same Jotform account in each plugin. This lets them share forms.

## Check that it works

Ask Claude:

> Find my forms.

Claude should list your forms. In Claude Code, you can also run a skill directly, such as `/jotform:jotform-forms`.

## Problems

| Problem | What to do |
| --- | --- |
| A plugin is not found | Add the marketplace `jotform/mcp-server`. Use an install ID from the table above. |
| A skill is missing | Check that the plugin is on, then start a new session. In Claude Code, run `claude plugin list`. |
| Claude says a connection is missing | Install the plugin for that product. For example, Sign needs the Jotform Sign plugin. |
| Claude asks you to sign in | Open `/mcp` in Claude Code, or **Connectors** on claude.ai, and sign in again. |
| A form shows in one product but not another | Use the same Jotform account in every plugin. |
| Your organization blocks the plugin | Ask your organization owner to turn it on. |

Claude docs: [marketplaces](https://code.claude.com/docs/en/plugin-marketplaces) · [plugins on claude.ai](https://claude.com/docs/plugins/build) · [MCP in Claude Code](https://code.claude.com/docs/en/mcp)

[What each server can do](mcp/tools.md) · [Sign-in and access](mcp/authentication.md) · [Back to start](../README.md)

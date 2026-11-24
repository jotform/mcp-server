# Development and release

This guide is for people who change this repository. Users do not need it.

## Layout

| Path | What it is |
| --- | --- |
| `README.md` | The start page. Users pick how they connect and open one guide. |
| `docs/claude-plugins.md` | Guide: install the Claude plugins. |
| `docs/gemini-extension.md` | Guide: install the Gemini extension. |
| `docs/app-directory.md` | Guide: connect from the ChatGPT or claude.ai directory. |
| `docs/server-address.md` | Guide: add the server address in Codex, Cursor, VS Code, or any MCP tool. |
| `docs/mcp/` | Server addresses, tools, and sign-in. |
| `integrations/claude/form-creator/` | Form Creator plugin. Forms connection and the forms skills. |
| `integrations/claude/jotform-sign/` | Jotform Sign plugin. Sign connection and the Sign skills. |
| `integrations/claude/jotform-apps/` | Jotform Apps plugin. Apps connection and the Apps skills. |
| `.claude-plugin/marketplace.json` | Claude marketplace catalog. It lists the three plugins. |
| `integrations/chatgpt/jotform/` | Jotform plugin for ChatGPT. Forms connection and the forms skills. |
| `integrations/chatgpt/jotform-sign/` | Jotform Sign plugin for ChatGPT. Sign connection and the Sign skills. |
| `integrations/chatgpt/jotform-apps/` | Jotform Apps plugin for ChatGPT. Apps connection and the Apps skills. |
| `.agents/plugins/marketplace.json` | Local catalog for ChatGPT and Codex. It lists the three ChatGPT plugins. |
| `scripts/package-chatgpt.sh` | Builds the ZIP of one ChatGPT plugin for upload to OpenAI. |
| `scripts/check.sh` | Checks the manifests, the catalogs and the skills. `.github/workflows/check.yml` runs it on every pull request. |
| `gemini-extension.json` | Gemini extension manifest. It must stay at the root. |
| `JOTFORM.md` | Instructions the Gemini extension loads. It must stay at the root. |
| `AGENTS.md` | File map and rules for repository agents. |

The ChatGPT plugins are not published yet. Until they are, the ChatGPT guide describes the app directory.

## Rules

- One plugin per product for each host. Each plugin has one connection and its own skills. A product's Claude and ChatGPT plugins carry the same skills.
- Each plugin folder must work on its own. Do not link to files outside it with a relative path. Use a full GitHub URL instead.
- Claude plugins keep the MCP connection in `.mcp.json` at the plugin root. Put each skill in `skills/<skill>/SKILL.md`. Claude finds both on its own.
- ChatGPT plugins use the Agent Plugins format: `plugin.json` and `mcp.json` at the plugin root, and the OpenAI listing under `extensions.com.openai.interface`. `logo` and `composerIcon` must be square images of at least 48 × 48.
- Jotform exports each plugin's `plugin.json`, its connection (`.mcp.json` or `mcp.json`), its catalog entry, every `SKILL.md` and `JOTFORM.md` from its internal source. `metadata.version` in a Claude skill shows which source it carries. ChatGPT skills have no stamp, because OpenAI ignores `metadata`. The export raises a plugin's `version` when its files change. A change made only here is overwritten by the next export.
- Keep plugin names and server addresses the same. Change them only when the task asks for it.
- Docs describe only what Jotform has published. Check the live server's tool list when unsure.

## Make a change

| Change | Edit |
| --- | --- |
| A skill | Open an issue or a pull request. A maintainer applies the change to the source and exports it. |
| A plugin connection or listing | Follow the skill row. For a connection, also update `docs/mcp/endpoints.md`. |
| A new plugin | A maintainer adds it to the source and exports it. Then add its icon, a `README.md` for a Claude plugin, and a row to the root `README.md`. |
| The Gemini extension | `gemini-extension.json`. For `JOTFORM.md`, follow the skill row. |
| Setup steps | The guide for that connection method in `docs/` |

## Check your change

1. Run `git diff --check` and `scripts/check.sh origin/master`. The script also fails when a plugin changed but its `version` did not.
2. With Claude Code installed, run:

   ```sh
   claude plugin validate .
   claude plugin validate ./integrations/claude/form-creator
   claude plugin validate ./integrations/claude/jotform-sign
   claude plugin validate ./integrations/claude/jotform-apps
   ```

3. For a ChatGPT plugin, install it in ChatGPT desktop, then restart the app:

   ```sh
   codex plugin marketplace add .
   codex plugin add jotform@jotform-plugins
   ```

4. Try the change in the AI tool with a test account. Check that "Find my forms" returns the right forms, and that the scenario you changed works.
5. Write the tool version and the result in the pull request.

## Release

Release each plugin on its own. The export raises the `version` in its `plugin.json` when the plugin changes, so raise it by hand only for a larger step. Write release notes. Claude Code keeps users on the old `version` until it changes. The Claude directory reads `icon`, `documentationUrl`, `supportUrl`, `privacyPolicyUrl`, and `termsOfServiceUrl` from `plugin.json`.

**Claude.** Submit each plugin folder separately through Anthropic's portal. When you make an archive, include one plugin folder with its hidden files, and nothing else. See [plugin submissions](https://claude.com/docs/plugins/submit).

**ChatGPT.** Run `scripts/package-chatgpt.sh <plugin>`, and upload the ZIP from `dist/` on the [OpenAI plugin portal](https://platform.openai.com/plugins). For a plugin that already exists, use "Upload plugin to make changes". Enter the reviewer test account in the portal, never in the ZIP. See [upload and submit](https://developers.openai.com/plugins/deploy/submission).

**Gemini CLI.** Keep `gemini-extension.json` and `JOTFORM.md` at the root. Gemini CLI installs from GitHub's **Latest** release, so do not mark a Claude release as Latest. Keep the manifest version equal to the release tag. See [Gemini release rules](https://geminicli.com/docs/extensions/releasing/).

[Back to start](../README.md)

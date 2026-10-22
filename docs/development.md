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
| `integrations/claude/form-creator/` | Form Creator plugin. Forms connection and the `jotform-forms` skill. |
| `integrations/claude/jotform-sign/` | Jotform Sign plugin. Sign connection and the `jotform-sign` skill. |
| `integrations/claude/jotform-apps/` | Jotform Apps plugin. Apps connection and the `jotform-apps` skill. |
| `.claude-plugin/marketplace.json` | Claude marketplace catalog. It lists the three plugins. |
| `gemini-extension.json` | Gemini extension manifest. It must stay at the root. |
| `JOTFORM.md` | Instructions the Gemini extension loads. It must stay at the root. |
| `AGENTS.md` | File map and rules for repository agents. |

There is no OpenAI package. ChatGPT and Codex only need a guide.

## Rules

- One Claude plugin per product. Each plugin has one connection and its own skills.
- Each plugin folder must work on its own. Do not link to files outside it with a relative path. Use a full GitHub URL instead.
- Keep the MCP connection in `.mcp.json` at the plugin root. Put each skill in `skills/<skill>/SKILL.md`. Claude finds both on its own.
- Keep plugin names and server addresses the same. Change them only when the task asks for it.
- Docs describe only what Jotform has published. Check the live server's tool list when unsure.

## Make a change

| Change | Edit |
| --- | --- |
| A skill | `integrations/claude/<plugin>/skills/<skill>/SKILL.md` |
| A plugin connection | That plugin's `.mcp.json`, then `docs/mcp/endpoints.md` |
| A new Claude plugin | Add `integrations/claude/<plugin>/`, add it to `marketplace.json`, and add a row to `README.md` |
| The Gemini extension | `gemini-extension.json` and `JOTFORM.md` |
| Setup steps | The guide for that connection method in `docs/` |

## Check your change

1. Run `git diff --check`.
2. With Claude Code installed, run:

   ```sh
   claude plugin validate .
   claude plugin validate ./integrations/claude/form-creator
   claude plugin validate ./integrations/claude/jotform-sign
   claude plugin validate ./integrations/claude/jotform-apps
   ```

3. Try the change in the AI tool with a test account. Check that "Find my forms" returns the right forms, and that the scenario you changed works.
4. Write the tool version and the result in the pull request.

## Release

Release each plugin on its own. Bump the `version` in its `plugin.json` and write release notes.

**Claude.** Submit each plugin folder separately through Anthropic's portal. When you make an archive, include one plugin folder with its hidden files, and nothing else. See [plugin submissions](https://claude.com/docs/plugins/submit).

**Gemini CLI.** Keep `gemini-extension.json` and `JOTFORM.md` at the root. Gemini CLI installs from GitHub's **Latest** release, so do not mark a Claude release as Latest. Keep the manifest version equal to the release tag. See [Gemini release rules](https://geminicli.com/docs/extensions/releasing/).

[Back to start](../README.md)

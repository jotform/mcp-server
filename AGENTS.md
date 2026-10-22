# Repository guide

This repository documents Jotform's hosted MCP servers and packages them for AI tools. A reader starts at `README.md`, picks how they connect, follows one guide, and makes a first request.

## Find the right file

| Task | Start here |
| --- | --- |
| Change the start page | `README.md` |
| Update setup steps | `docs/claude-plugins.md`, `docs/gemini-extension.md`, `docs/app-directory.md`, `docs/server-address.md` (one guide per connection method) |
| Explain servers, tools, or sign-in | `docs/mcp/endpoints.md`, `docs/mcp/tools.md`, `docs/mcp/authentication.md` |
| Change a Claude plugin | `integrations/claude/<plugin>/` (`jotform`, `jotform-sign`, `jotform-apps`) |
| Change the Claude catalog | `.claude-plugin/marketplace.json` |
| Change the Gemini extension | `gemini-extension.json` and `JOTFORM.md` |
| Develop or release | `docs/development.md` |

## Rules

- Write short, plain sentences. One idea per sentence.
- Four connection methods, four guides: plugin, extension, app directory, server address. `README.md` links to them. Do not add index pages.
- Public docs say what a user can do and how. Agent behavior belongs in skills and `JOTFORM.md`.
- Describe only published services. Check [Jotform MCP](https://www.jotform.com/mcp/), the [developer reference](https://www.jotform.com/developers/mcp/), and the live server's tool list. Flag conflicting claims instead of guessing.
- Plugin manifests are the source for endpoints. Keep `docs/mcp/endpoints.md` aligned with them. The Gemini `/default` route is the same main server as `https://mcp.jotform.com`.
- One Claude plugin per product. Each plugin has one connection and its own skills. Each plugin folder works on its own; link to other plugins with a full GitHub URL.
- Keep the MCP connection in `.mcp.json` at the plugin root and each skill in `skills/<skill>/SKILL.md`. Claude Code did not detect connections declared inline in `plugin.json`.
- Keep `gemini-extension.json` and `JOTFORM.md` at the root. Keep plugin names and server addresses unless the task changes them.
- There is no OpenAI package. Describe only routes that exist.

## Verify changes

Run `git diff --check`. For Claude changes, run `claude plugin validate .` and `claude plugin validate ./integrations/claude/<plugin>`. Check all local links still resolve. See `docs/development.md` for live checks.

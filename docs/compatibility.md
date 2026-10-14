# Compatibility and change boundaries

This repository distributes documentation and client packages for hosted services. The Claude pilot adds a package under `plugins/jotform` and a marketplace entry; it does not contain or deploy the production backend, Node transport, or frontend widget code.

| Surface | Package/endpoint | Change in this pilot |
| --- | --- | --- |
| Gemini CLI | Root `gemini-extension.json`, `JOTFORM.md`; `/default` endpoint | Existing files and configuration preserved |
| Existing generic MCP clients | Existing root MCP URL and configuration | No endpoint changes |
| Existing ChatGPT apps | Existing three product connections | No app binding, schema, OAuth, or service changes |
| Existing Claude connectors | Existing three product connections | Exact product URLs reused |
| Claude web/Cowork | `plugins/jotform` ZIP or marketplace install | Four skills plus three remote connector references; authenticated host checks pending |
| Claude Code | `plugins/jotform` or `jotform@jotform-plugins` | Package validation and isolated installation can be tested locally |

The backend's product configurations, Node server routing, and existing MCP frontend adapter informed the skills. Those checkouts are not deployed server snapshots. Live `tools/list` and `resources/list` remain authoritative. Host-qualified tool names are selected by connector; shared names such as `search`, `fetch`, and `get_teams` are intentionally not merged.

No public installation will receive parent-repository `docs/` files, maintenance scripts, or CI as part of the plugin ZIP. All skill dependencies are inside `plugins/jotform`. This package does not aggregate tools into a new endpoint or change OAuth scopes/client registration.

The CI workflow validates and exports files with read-only repository permissions. It has no deployment, publication, release creation, or OAuth steps. Changes to backend/frontend/transport required by a host issue belong in a separate reviewed change.

OpenAI submission is outside this pilot. The Claude archive is not claimed to be an OpenAI submission package, and no OpenAI app references, manifests, or shared endpoint have been added.

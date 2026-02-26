# Jotform Gemini CLI Extension

## Overview

This extension connects Gemini CLI to Jotform's hosted Model Context Protocol (MCP) server at `https://mcp.jotform.com`.

## Installation

To install the extension, run the following command in your terminal:

```bash
gemini extensions install https://github.com/jotform/mcp-server
```

Once installed, start Gemini CLI by running:

```bash
gemini
```

## Authentication

Prior to using tools from the Jotform MCP server you must authenticate. This is done by running `/mcp auth jotform` which will open an OAuth flow in your browser:

```
/mcp auth jotform
```

After authenticating, all the Jotform tools will be available.

## Custom Commands

Several custom slash commands are available to interact with Jotform. These commands are shortcuts for common Jotform tasks.

They all are prefixed with `/jotform:`:

- **/jotform:create-form**: Create a new form (e.g., "contact form with name and email").
- **/jotform:list-forms**: List your forms with optional filters.
- **/jotform:get-submissions**: Get submissions for a specific form (requires Form ID).
- **/jotform:edit-form**: Edit an existing form (requires Form ID).
- **/jotform:search-forms**: Search for forms by keyword.

## Usage Examples

```
/jotform:create-form contact form with name, email, and message
/jotform:list-forms show me forms created this month
/jotform:get-submissions 123456789
/jotform:edit-form 123456789 add a phone number field
/jotform:search-forms customer feedback
```

You can also use natural language without commands:
```
Create a contact form with name and email
List all my forms
Show me submissions for form 123456789
```

## Troubleshooting

If you have already installed the extension, below are some common troubleshooting steps:

- Run `/mcp list` to confirm the `jotform` server is connected.
- Run `/mcp desc jotform` to see detailed overview of available tools.
- Run `/mcp auth jotform` to authenticate with Jotform.

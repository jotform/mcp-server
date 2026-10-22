# Gemini extension

The Jotform extension adds forms and responses to [Gemini CLI](https://geminicli.com/docs/get-started/installation/).

## Steps

1. Run this command in your terminal:

   ```sh
   gemini extensions install https://github.com/jotform/mcp-server
   ```

2. Start Gemini CLI with `gemini`.
3. Type this command:

   ```text
   /mcp auth jotform
   ```

4. Sign in to Jotform in your browser.

## Check that it works

Type `/mcp` to see the connection. Then ask:

> Find my forms.

## Problems

| Problem | What to do |
| --- | --- |
| The extension is missing | Run `gemini extensions list`. Check that `jotform` is there. Restart Gemini CLI. |
| You are asked to sign in | Run `/mcp auth jotform` and sign in again. |
| You see the wrong forms | Sign in with the right Jotform account. |

The extension settings are in [`gemini-extension.json`](../gemini-extension.json). Gemini reads [`JOTFORM.md`](../JOTFORM.md) as extra instructions.

Gemini docs: [extensions](https://geminicli.com/docs/extensions/) · [commands](https://geminicli.com/docs/reference/commands/)

[What each server can do](mcp/tools.md) · [Sign-in and access](mcp/authentication.md) · [Back to start](../README.md)

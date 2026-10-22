# Sign-in and access

You sign in to Jotform in your browser. Your AI tool then keeps the connection for you. You never paste a password or API key.

## How to sign in

1. Add Jotform to your AI tool. Pick your guide on the [start page](../../README.md#start-here).
2. Choose the sign-in action in your AI tool.
3. Sign in to Jotform in your browser and approve access.
4. Go back to your AI tool. The Jotform tools are now ready.

## What your AI tool can see

Your AI tool sees what your Jotform account can see. It cannot do more than your account can.

In Claude, Forms, Sign, and Apps are separate plugins. Sign in with the same Jotform account in each one. Then they can share forms.

Your organization may limit which connections you can use. For workspace installs, an admin must install Jotform. See [Jotform's requirements](https://www.jotform.com/developers/mcp/?tab=mcp).

## Remove access

1. In Jotform, open **My Account → Connected Apps → Jotform MCP → Clients**.
2. Find the AI tool. Open its **⋮** menu and choose **Revoke**.

The AI tool must sign in again to use Jotform.

## Problems

| Problem | What to do |
| --- | --- |
| You are asked to sign in again | Open the connection in your AI tool and sign in. |
| Forms or documents are missing | Check the account and team you signed in with. |
| Sign or Apps tools are missing | Install and connect that product's [Claude plugin](../claude-plugins.md). |
| Your organization blocks Jotform | Ask your admin to turn it on. |
| You see an HTTP 429 error | You sent too many requests. Wait and try again. |

Still stuck? Contact [Jotform Support](https://www.jotform.com/answers/). Say which AI tool and server address you use, and include the error message. Do not share passwords or private responses.

[Server addresses](endpoints.md) · [What each server can do](tools.md) · [Back to start](../../README.md)

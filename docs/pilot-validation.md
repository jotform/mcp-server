# Claude pilot acceptance record

## Status convention

Record each case as **Passed**, **Failed**, **Blocked**, or **Not run** with the date, package version, host, evidence, and observed result. A local validator pass is not evidence of OAuth, live tool invocation, UI rendering, or workflow quality. Use dedicated test accounts and fictional sample content; keep tokens, credentials, signing links, and private data out of this repository.

## Baseline and setup

On 2026-10-14, package/marketplace strict validation, ZIP extraction validation,
and isolated Claude Code marketplace installation passed for `0.1.0`.
The installed inventory contained four skills and three MCP server definitions.
All three public resource-discovery URLs returned HTTP 200 and advertised
`https://oauth2.jotform.com` with `readOnly`/`full` scopes. Unauthenticated GETs
to the three tool endpoints returned HTTP 401 (`NO_AUTH_HEADER`) without a
`WWW-Authenticate` header. This confirms access protection but does not prove
that a fresh plugin connection completes OAuth discovery; test that explicitly
in the host. No authenticated tool/resource baseline or live product call was
performed. The cases below therefore remain **Not run**.

Before authenticated tests, record the three existing Claude connectors' tool/resource inventory and representative behavior on the same test account. Do not assume the sibling source checkouts match production. Compare the inventory after plugin installation. Use a clean account plus an account with existing connectors. Record how many login and consent screens appear and which account/workspace each connection uses.

## Required cases

| Case | Prompt/setup | Observable pass condition | Status |
| --- | --- | --- | --- |
| Discovery | Install the exact ZIP in web, Cowork, and Code | Four skills load; three connector entries exist; no product calls occur just to inspect skills | Not run |
| Existing connections | Install with all three existing connectors already connected | Tools are not duplicated; existing connections remain usable | Not run |
| Product routing | With all connectors available, find a known form, Sign draft, and app | Each overlapping search/fetch/status call uses the intended product | Not run |
| Form creation | Create a feedback form with rating and optional comment | Correct workspace; ready form and preview; one asset; no unrequested submission | Not run |
| Form edit and read | Change the test form's title, then inspect its submissions | Same form edited; unrelated fields retained; reported submission counts match actual results | Not run |
| Form pending/confirmation | Use a request that actually returns processing or confirmation | Same ID retrieved at supported timing; no repeated create/edit; question shown when required | Not run |
| App edit | Add a resources page to a known test app | Correct app edited; unrelated pages retained; pending response not reported as completed | Not run |
| Sign draft | Prepare a document using supplied sample terms; do not send | Actual draft/preview; correct content; no send call or invitation | Not run |
| Sign send/status | Explicitly send that ready test document to configured test signers | Correct roles; one send; actual sent-copy ID used when available; status accurately reported | Not run |
| Signing link boundary | Request a personal signing link if the tool is exposed | Actual eligible sent-copy link; signing stays in browser; no link added to a shared app | Not run |
| Client onboarding | Create an intake form and client portal reusing it; prepare an agreement draft only | Portal opens exact original form; one form and portal; separate draft; no invitation | Not run |
| Event management | Create workshop registration and event app with supplied schedule/venue | Exact form reused; correct content; no invented payment/publishing setup or unrequested Sign document | Not run |
| Missing connection | Leave Apps disconnected and request a form-to-app workflow | Needed connection named; no credentials requested; form preserved; no fabricated portal | Not run |
| Wrong account/access | Connect a product to a different authorized test account lacking asset access | Access failure explained; no workaround that copies private data or changes account permissions | Not run |
| Ambiguous write response | Controlled test failure after a create/send request | Existing asset/status inspected before retry; no duplicate asset/invitation; uncertainty stated | Not run |
| Incomplete embedding evidence | Returned app details do not expose embedded form ID | Workflow marked unverified; preview inspection requested; no fabricated verification | Not run |
| Unsupported attachment | Host cannot provide the file input expected by a tool | No guessed file ID/URL or ChatGPT-only injection; supported alternative explained | Not run |
| Disconnect/revoke | Dedicated account: disconnect one connector, then separately revoke consent | Actual impact on other connections recorded; existing authorization behavior preserved | Not run |
| Uninstall | Remove pilot plugin from a test account with prior connectors | Prior connectors remain usable; no service or data deletion performed | Not run |
| Regression | Exercise representative operations in all six existing ChatGPT/Claude connections and Gemini | Existing behavior remains operational; Gemini configuration unchanged | Not run |

Run each applicable case separately in web and Cowork. Code installation/discovery is also required; UI checks are host-specific. A failure requiring server changes blocks public release of this package until addressed in a separate change.

## Compare workflow value

Use the same onboarding and event prompts with and without the plugin, on fresh sample assets. Compare correct connector selection, completed requested outcomes, exact form reuse, unnecessary questions, duplicate writes, and time to a verified first result. Do not equate more tool calls or more created assets with improvement. Any measurement request must not trigger unsolicited monitoring or a new analytics collector.

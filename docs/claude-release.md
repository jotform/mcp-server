# Claude release preparation

Version `0.1.0` is a private pilot. The package is not yet a reviewed public listing. Complete the following before a public `1.0.0` release.

## Listing draft

- Name/display name: `jotform` / **Jotform**. Confirm directory name availability in Jotform's Claude organization; do not silently rename the released identity.
- Publisher: **Jotform Inc.**; use the organization that should own the listing long term.
- Source: `https://github.com/jotform/mcp-server`.
- Plugin path: `plugins/jotform`.
- Description: "Create and manage forms, prepare documents for signature, and build Jotform Apps. Combine the products for client onboarding and event management."
- Package license: MIT. Hosted product terms are separate.

The source URL is a target for the reviewed changes, not a claim that this local branch has already been published there. Keep the three existing connector listings and URLs; confirm their ownership and any supported listing pairing in the portal rather than creating replacement connectors.

## Release gates

1. Pass strict plugin/marketplace validation and inspect the built ZIP. The package must include its own README and license, all skill references, and no credentials, symlinks, system files, executables, or parent-repository dependencies.
2. Complete [pilot validation](pilot-validation.md), including exact form reuse in both recipes, OAuth session/consent behavior, widgets, and existing-connector regression. Record actual evidence; local code review does not substitute for live checks.
3. Rehearse and record the actual installed version in a pilot account. Show the three product connections, onboarding form/portal reuse and separate draft agreement, and event registration/app reuse. Use sample content. Store a reviewer-accessible recording URL in the release record only after verifying playback. A script is not a recording.
4. Verify the publisher's support, privacy, and terms links and the applicability of the actual Jotform policies to this integration. Have the owner provide contact, data handling, retention, and audience answers from confirmed product practices. The source package adds no local persistence or telemetry; hosted service behavior still needs accurate disclosure.
5. Raise the package version to `1.0.0`, rebuild, and rerun affected checks. Choose a tested release tag rather than tracking unrelated default-branch changes. Keep public automatic publication disabled initially; follow the portal's actual review/publish controls.
6. Have an authorized Jotform organization owner validate **Plugin bundle** in the [Claude developer portal](https://claude.ai/directory/manage), resolve blocking findings, and submit the intended source path/version. Submission and publishing are distinct actions. No portal action is performed by the packaging script or CI.

## Rollback

Stop pilot distribution or delist the plugin through the portal if a released version fails. Restore a known good package/version through the supported portal process. Preserve existing standalone connectors, endpoints, accounts, and assets. Removing a plugin is not the same action as revoking Jotform OAuth consent.

## Growth measurement

Start with onboarding and event management as hypotheses. Track directory views/install conversion and platform-reported skill/connector activity. For authorized product measurement, use existing data to assess time from connection to a first completed asset, exact workflow completion, seven-day second-product adoption, and seven/thirty-day repeat use. Define asset completion from verified outcomes, not merely tool calls.

The same endpoint is used by the plugin and standalone connectors. Server logs alone do not establish plugin attribution or a user-level join with plugin installation. Keep that limitation explicit. Do not add query parameters to canonical MCP URLs for tracking or collect private content in the plugin.

## References

- [Submission checklist](https://claude.com/docs/plugins/pre-submission-checklist)
- [Submit a plugin](https://claude.com/docs/plugins/submit)
- [Publication and usage](https://claude.com/docs/connectors/building/after-publishing)

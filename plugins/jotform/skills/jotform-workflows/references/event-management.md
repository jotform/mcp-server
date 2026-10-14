# Event management

## Example request

"Create a workshop registration form and an event app containing that same form, the schedule, and venue details. Do not add a signing document unless I ask for one."

## Execution

1. Use supplied event dates, venue, schedule, and registration fields. Resolve missing essentials before publishing them as facts. For an existing form, retrieve it through Forms tools; otherwise call Forms `create_form` and keep its returned ID and URL.
2. When the form is ready, call Apps `create_app` with the event content and an explicit instruction to embed that exact form ID/URL without creating a replacement. To update an existing event app, use Apps `edit_app` with the verified app ID and `instructions`.
3. Track background work through the appropriate connector. Verify that registration opens the original form. Do not claim publication, payment configuration, attendee synchronization, or email reminders unless an actual tool result verifies a user-requested operation.
4. Only if the user requests a signing document, prepare a separate Sign draft from their supplied content. Do not invent consent language, participant addresses, or a mass-signing workflow. Sending requires an explicit user instruction and known signer roles/recipients.

## Observable success

- The registration form and event app exist and are ready.
- The event app uses the same registration form, with the supplied schedule and venue.
- No Sign document or signature invitation exists unless requested.
- Any requested signing step is reported according to its actual result.

This recipe does not set up an unattended registration-to-signature trigger or ongoing event reminders.

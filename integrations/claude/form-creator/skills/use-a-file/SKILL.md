---
name: use-a-file
description: Get a file from the user for a tool that takes one, such as a PDF, Word document or image to build a form or a signing document from. Use whenever the user wants to start from or use a file, even one they have not shared yet.
metadata:
  version: "534ef2812435"
---

# Upload a file

1. Call `upload_file` before the tool that takes the file. Give it the file's link when you have one, such as a chat attachment's URL or a link the user shared.
2. When you cannot pass the file as a link, such as one on the user's device that they have not shared yet, call `upload_file` without a file. It opens an upload card where the user chooses the file. Do not ask them to attach it to the chat. Ask them in one short sentence to choose the file there, then stop: the uploaded file comes back as their next message.
3. Pass the object that `upload_file` returns as the file input of the tool that needs it, such as `document_file` or `file`.

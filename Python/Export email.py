import os
import requests
import base64

# Replace with your own values
access_token = "your_access_token"
subject_to_search = "XXXX"
download_folder = "attachments"  # Folder where attachments will be saved

# Create the download folder if it doesn't exist
if not os.path.exists(download_folder):
    os.makedirs(download_folder)

# Keep track of downloaded filenames
downloaded_files = set()

def download_attachment(attachment):
    attachment_name = attachment.get("name")
    if attachment_name in downloaded_files:
        print(f"Skipping {attachment_name} (already downloaded)")
        return

    attachment_content = attachment.get("contentBytes")
    if attachment_content:
        # Decode base64 content
        decoded_content = base64.b64decode(attachment_content)

        # Save the attachment to the download folder
        save_path = os.path.join(download_folder, attachment_name)
        with open(save_path, "wb") as f:
            f.write(decoded_content)

        print(f"Downloaded {attachment_name}")
        downloaded_files.add(attachment_name)
    else:
        print(f"Attachment {attachment_name} has no content.")

def main():
    url = f"https://graph.microsoft.com/v1.0/me/messages?$filter=subject eq '{subject_to_search}'"
    headers = {
        "Authorization": f"Bearer {access_token}"
    }

    response = requests.get(url, headers=headers)
    messages = response.json().get("value", [])

    for message in messages:
        attachments = message.get("attachments", [])
        for attachment in attachments:
            download_attachment(attachment)

if __name__ == "__main__":
    main()

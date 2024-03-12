import requests
import json

# Set your Recorded Future API key
api_key = "c3d6c3f92c11c2d173b8fa353c082ab794bdd510"

# Define the Recorded Future API endpoint
api_url = "https://sandbox.recordedfuture.com/api/v0/"

# Define the website to test
website = "https://www.example.com"  # Replace with the actual website URL

# Define the query parameters
params = {
    "url": website,
    "format": "json"
}

# Set the headers with the API key
headers = {
    "X-RFToken": api_key
}

# Make the API request
response = requests.get(api_url, params=params, headers=headers)

# Check if the request was successful
if response.status_code == 200:
    # Parse the JSON response
    data = response.json()
    # Print the results
    print("Recorded Future Sandbox Analysis for", website)
    print("Risk Score:", data.get("riskScore", "N/A"))
    print("Risk Level:", data.get("riskLevel", "N/A"))
    print("Risk Factors:")
    for factor in data.get("riskFactors", []):
        print(f"- {factor.get('name', 'N/A')}: {factor.get('description', 'N/A')}")
else:
    print("Error:", response.status_code)
    print(response.text)

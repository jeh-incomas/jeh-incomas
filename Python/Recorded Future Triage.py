import json
import requests

# Set your Recorded Future API key
api_key = "YOUR_API_KEY"

# Define the Recorded Future API endpoint
api_url = "https://sandbox.recordedfuture.com/api/v0/"

# Define the website to test
website = "https://www.example.com"  # Replace with the actual website URL

# Define the query parameters
try:
    response = requests.get(api_url, params=params, headers=headers)
except Exception as e:
    print(f"An error occurred while making the API request: {e}")
    response = None

if response and response.status_code == 200:
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

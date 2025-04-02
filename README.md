# AI Activity Recommendation

This AI piece is part of a Swift-based iOS app that lets users select their preferences and get personalized activity recommendations powered by the OpenAI API. The AI logic is handled via a Python Lambda function deployed on AWS, using API Gateway for communication.

---

## Overview

- **Frontend**: SwiftUI iOS app (iPad compatible, tested via simulator)
- **Backend**: Python + OpenAI in AWS Lambda
- **Deployment**: AWS Lambda with API Gateway (POST endpoint)
- **Model Used**: `gpt-4` via `openai` Python SDK
- **User Flow**:  
  1. Select preferences 
  2. Tap button to fetch personalized recommendation  
  3. View result with loading spinner while waiting  

---

### AWS Lambda (Python)

**Lambda Entrypoint**: `lambda_function.py`

**Key Features**:
- Loads activity names from `activity_names.txt`
- Accepts a list of user preferences via `event["body"]`
- Builds prompt dynamically using preferences + activity list
- Sends request to OpenAI and returns the result
- Handles timeouts, API errors, and prompt parsing failures gracefully

**Environment Variables Required**:
- `OPENAI_API_KEY` (stored in Lambda → Configuration → Environment Variables)

**Python Libraries Used**:
- `openai`
- `json`, `os`, `subprocess`

> *All dependencies must be built for Linux/`x86_64` using Docker.*
> *I found it was very difficult to do this on a MacOS computer and used a Windows computer to deploy the lambda function.*

---

## Error Handling

### In `lambda_function.py`

| Type                       | Message Output                                   | Debug Location      |
|---------------------------|---------------------------------------------------|---------------------|
| Missing API Key           | `API Key not found!`                              | `get_api_key()`     |
| Missing activity file     | `activity_names.txt not found`                    | `load_activity_names()` |
| Invalid AI Response       | `Invalid value for 'content': expected a string`  | After `openai.ChatCompletion.create()` |
| Prompt too long / empty   | Detected using `print("[DEBUG] Final prompt:", prompt)` |
| Request Timeout           | Handled in Lambda settings (increased timeout to 60s) |
| API Gateway Failures      | Response: `{"message": "Internal Server Error"}`  | App displays fallback text |

---

## Debug Tips For the AI Preferences Piece

### Use CloudWatch Logs (AWS Console)
- Navigate to Lambda → Monitor → View logs in CloudWatch
- Logs include `[DEBUG]` statements for:
  - Received event
  - User preferences
  - Loaded activities
  - Final prompt
  - API key status
  - API response issues
- Check REPORT for information about Timeout(it has been increased to 60s).
- Check to ensure that there is still credit available on OpenAI to run (5 dollars were originally loaded and it took 50 cents to get it up and working). 

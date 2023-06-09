#Introduction
This documentation provides an overview of a messaging app built using Django, along with instructions for setting up and deploying the app on Google Cloud Platform (GCP). The app allows users to add friends and chat with them in real-time.

Prerequisites
Python 3.x
Django
Channels
Installation
Install Django Channels by running the following command:
Copy code
pip3 install django channels
Local Development
To run the app locally, follow these steps:

Clone the repository from GitHub:

bash
Copy code
git clone <repository_url>
Change to the project directory:

bash
Copy code
cd django-messaging-app
Apply migrations to set up the database:

Copy code
python3 manage.py migrate
Start the Django development server:

Copy code
python3 manage.py runserver
Access the app in your browser at http://localhost:8000.

Deployment on Google Cloud Platform
To deploy the app on GCP using Google Cloud Build for automatic deployment, follow these steps:

Set up a GCP project and enable the necessary APIs (e.g., Compute Engine, Container Registry).

Create a Dockerfile in the project's root directory with the following content:

Dockerfile
Copy code
FROM python:3

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
Create a cloudbuild.yaml file in the project's root directory with the following content:

yaml
Copy code
steps:
  - name: "gcr.io/cloud-builders/docker"
    args: ["build", "-t", "gcr.io/<project_id>/<image_name>:<tag>", "."]
  - name: "gcr.io/cloud-builders/docker"
    args: ["push", "gcr.io/<project_id>/<image_name>:<tag>"]
  - name: "gcr.io/cloud-builders/gcloud"
    args: ["run", "deploy", "<service_name>", "--image", "gcr.io/<project_id>/<image_name>:<tag>", "--platform", "managed", "--region", "<region>"]
Replace <project_id>, <image_name>, <tag>, <service_name>, and <region> with the appropriate values.

Configure the GitHub repository to trigger a Cloud Build when changes are committed:

In the GCP Console, navigate to Cloud Build.
Click "Triggers" in the left sidebar.
Click "Connect Repository" and select your GitHub repository.
Configure the trigger settings according to your requirements.
Push your code changes to the GitHub repository, and Cloud Build will automatically build and deploy the Docker image to GCP.

Usage
Once the app is running locally or deployed on GCP, follow these steps to use the messaging app:

Sign up for an account or log in if you already have one.

Add friends by searching for their usernames or email addresses.

Start a conversation with a friend by selecting their name from the friend list.

Type your messages in the input field at the bottom of the chat window and press Enter to send them.

The messages will be displayed in the chat window, and new messages from your friends will appear in real-time.

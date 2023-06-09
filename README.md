# Django Messaging App

## Introduction
This is a messaging app built using Django, which allows users to add friends and chat with them. The app is designed to be deployed on Google Cloud Platform (GCP) using Google Cloud Build for automatic deployment.

## Prerequisites
- Python 3.x
- Django
- Channels

## Installation
1. Install Django by running the following command:

`pip3 install django channels`

## Local Development
To run the app locally, follow these steps:

Clone the repository from GitHub:

`git clone https://github.com/muhammadhumzadev/realtime_messaging_app.git`

Change to the project directory:

`cd realtime_messaging_app`

Apply migrations to set up the database:

`python3 manage.py migrate`

Start the Django development server:

`python3 manage.py runserver`

Access the app in your browser at http://localhost:8000.

## Deployment on Google Cloud Platform
To deploy the app on GCP using Google Cloud Build for automatic deployment, follow these steps:

Set up a GCP project and enable the necessary APIs 
1- Compute Engine
2- Container Registry.

For deployment I need the *Dockerfile*. Dockerfile is in the root directory.

I already create a **cloudbuild.yaml** file and **cloudbuild-trigger.yaml** in the project's root directory.

Configure the GitHub repository to trigger a Cloud Build when changes are committed:

In the GCP Console, navigate to Cloud Build.
Click "Triggers" in the left sidebar.
Click "Connect Repository" and select your GitHub repository.
Configure the trigger settings according to your requirements.
Push your code changes to the GitHub repository, and Cloud Build will automatically build and deploy the Docker image to GCP.

## Usage
Once the app is running locally or deployed on GCP, follow these steps to use the messaging app:

Sign up for an account or log in if you already have one.

Start a conversation with a friends by selecting on of the rooms.

Type your messages in the input field at the bottom of the chat window and press Enter to send them.

The messages will be displayed in the chat window, and new messages from your friends will appear in real-time.

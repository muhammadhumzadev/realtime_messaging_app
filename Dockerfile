# Use an official Python runtime as a parent image
FROM python:3.10-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

RUN export PATH="/root/.local/bin:$PATH" && \
    python3 /app/manage.py makemigrations

RUN export PATH="/root/.local/bin:$PATH" && \
    python3 /app/manage.py migrate

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run the command to start uWSGI
CMD ["python3", "/app/manage.py", "runserver", "0.0.0.0:8000"]

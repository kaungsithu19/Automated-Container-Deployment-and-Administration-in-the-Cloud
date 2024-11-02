# Start with a base image that has Python
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY app.py .

# Set the environment variable for Flask
ENV FLASK_APP=app.py

# Expose port 5000 (default Flask port)
EXPOSE 5000

# Run the application
CMD ["flask", "run", "--host=0.0.0.0"]

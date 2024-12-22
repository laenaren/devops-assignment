FROM python:3.9-slim

# Set environment variables
#ENV SECRET_KEY
#ENV DB_PASSWORD

#ENV LOG_LEVEL
#ENV API_BASE_URL
#ENV MAX_CONNECTIONS

# Set the working directory inside the container 
COPY ./app.py .
COPY ./requirements.txt .

#EXPOSE 5000

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set the command to run the Flask application
CMD ["python", "app.py"]

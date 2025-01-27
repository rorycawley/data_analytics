# Use a base image with Python 3.9 or higher
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Set the environment variable for dlt to find the ingestion script.
# This assumes your main script is named sql_database_pipeline.py
ENV PYTHONPATH "${PYTHONPATH}:/app"

# Create a non-root user and switch to it
RUN useradd --no-create-home -r -u 1001 dltuser && chown -R dltuser:dltuser /app
# RUN useradd -m dltuser && chown -R dltuser:dltuser /app
USER dltuser

# Command to run your data ingestion script
CMD ["python", "-u", "sql_database_pipeline.py"]
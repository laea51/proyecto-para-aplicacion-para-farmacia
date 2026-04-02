# 1. Use an official, lightweight Python base image
FROM python:3.12

# 2. Set the working directory inside the container
WORKDIR /app

# 1. Example: Symlink /usr/bin/python3 to /usr/bin/python
# This allows 'python' to work even if only 'python3' is installed
RUN ln -s /usr/bin/python3 /usr/bin/python

# 3. Copy only the requirements file first to leverage Docker's cache
COPY requirements.txt .

# 4. Install dependencies
# --no-cache-dir reduces image size by not storing the wheel cache
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application code
COPY . .

# 2. Example: Symlink a shared data folder to the app's internal static path
# Useful for referencing absolute system paths with relative app paths
RUN mkdir -p /mnt/shared_data && \
    ln -s /mnt/shared_data /app/static/data

# 6. Expose the port the app runs on (e.g., 8080)
EXPOSE 8080

# 7. Define the command to run the application
CMD ["python", "app.py"]

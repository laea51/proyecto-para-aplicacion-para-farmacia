# 1. Use an official, lightweight Python base image
FROM python:3.12

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy only the requirements file first to leverage Docker's cache
COPY requirements.txt .

# 4. Install dependencies
# --no-cache-dir reduces image size by not storing the wheel cache
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application code
COPY . .

# 6. Expose the port the app runs on (e.g., 8080)
EXPOSE 8080

# 7. Define the command to run the application
CMD ["python", "app.py"]

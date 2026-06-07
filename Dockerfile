# Step 1: Base image
FROM python:3.9-slim

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Step 4: Copy application code
COPY . .

# Step 5: Configure non-root user for security
RUN useradd --uid 1000 theia && chown -R theia /app
USER theia

# Step 6: Expose application port
EXPOSE 8080

# Step 7: Run the application with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--log-level=info", "service:app"]

#Dockerfile

# Use a lightweight, stable Python base image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy dependency file first (for caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Expose default Streamlit port for local use
EXPOSE 8501

# Use dynamic PORT for Cloud Run, fallback to 8501 locally
ENV PORT=8501

# Run Streamlit using dynamic port (Cloud Run sets $PORT)
CMD ["sh", "-c", "streamlit run app.py --server.port=$PORT --server.address=0.0.0.0"]
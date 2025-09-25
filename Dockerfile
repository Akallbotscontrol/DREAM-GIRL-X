FROM python:3.10-slim

# Install dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir -U -r /requirements.txt

# Set workdir and copy code
WORKDIR /app
COPY . .

# Render exposes PORT env var, but Pyrofork doesn't need it
ENV PORT=10000

# Start bot
CMD ["python3", "bot.py"]

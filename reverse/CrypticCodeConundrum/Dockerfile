# Use  Python 2 runtime as a parent image
FROM python:2-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Make port 1337 available
EXPOSE 1337

# Run the script when the container launches
CMD ["nc", "-lk", "-np", "1337", "-e", "python", "chall.py"]

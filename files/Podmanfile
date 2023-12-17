# Use the official Ubuntu image as the base
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Copy files (including hello.txt) into the container
COPY app/input /app/input

# Make sure the file is readable by all users
RUN chmod a+r /app/input/hello.txt

# Set the default command to run when the container starts
CMD cat /app/input/hello.txt

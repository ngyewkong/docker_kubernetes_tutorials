# Get base image
FROM python

# Set working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# CMD to invoke python command to run the server (not executed when building image but when creating container)
CMD ["python", "bmi.py"]

# Part 1 & 2 Assignment
# docker build .
# docker run -it <image id> --rm
# docker ps -a

# docker stop <container id>
# docker rm <container id>
# docker container prune

# Part 3 Assignment
# docker run -it --name python-bmi <image id>
# docker start -ai python-bmi

# Part 4 Assignment
# docker stop python-bmi
# docker container prune
# docker images
# docker rmi <image id>

# Part 5 Assignment
# docker build -t python-bmi:latest .

# Part 6 Assignment
# docker run -it --rm --name python-bmi-app python-bmi:latest
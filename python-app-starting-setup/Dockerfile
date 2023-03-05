# base image from python in Docker Hub
FROM python

# setting working directory (best practice to use /app instead of just root)
WORKDIR /app

# copy folder from current directory on local to container directory /app
COPY . /app

# CMD to invoke python command to run the python file (not executed when building image but when creating container)
CMD [ "python", "rng.py" ]

# note we are not exposing the port as this python file is not a server

# impt commands to build and run the image
# docker build .
# -i is interactive flag -t is terminal flag
# docker run -it <image-id>
# restart a container in interactive mode with terminal
# -a is attach flag -i is interactive flag 
# docker start -ai <container-id>
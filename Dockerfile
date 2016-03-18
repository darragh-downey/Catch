##############################
# Catch Dockerfile
##############################

# Set base image to Ubuntu
FROM ubuntu

# File author / maintainer
MAINTAINER Darragh Downey <darraghd@transdevsydney.com.au>

# Add the application resources URL
RUN echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) main universe" >>
  /etc/apt/sources.list

# Update the sources list
RUN apt-get update

# Install Python 3
RUN apt-get install -y python3 python3-dev python3-pip

# Copy the application folder inside the container
ADD /Catch /Catch

# Get pip to download and install requirements
RUN pip3 install -r /Catch/requirements.txt

# Expose ports
EXPOSE 5555

# Set the default directory where CMD will execute
WORKDIR /Catch

# Set the default command to execute
# when creating a new container
# i.e. using CherryPy to serve the application
CMD python3 pitch.py
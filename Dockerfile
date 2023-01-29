# os
FROM ubuntu:20.04

# apt
RUN apt-get -y update \
	&& apt-get install -y software-properties-common \
	&& apt-get -y update \
	&& apt-get install -y git python3-pip

# pip
RUN git clone https://github.com/matthewgadd/RobotCarDataset-Scraper.git \
    && cd RobotCarDataset-Scraper \
    && pip3 --default-timeout=100 install -r requirements.txt
    
RUN pip3 install chardet

# alias
RUN echo 'alias python=python3' >> ~/.bashrc \
	&& echo 'alias pip=pip3' >> ~/.bashrc
	
# set a user to change permissions on downloaded images (optionally)
#RUN useradd -u 1000 <USER_NAME>
#USER <USER_NAME>

# entry point at a working dir
ENTRYPOINT ["/bin/bash"]

# use then the following commands in the directory of the Dockerfile:
# docker build -t matthewgadd/robotcar-dataset-scraper:latest .
# docker run --rm -it -w /RobotCarDataset-Scraper -v $HOME/Downloads:/Downloads matthewgadd/robotcar-dataset-scraper:latest


FROM python:3.9-slim-buster
ENV PYTHONUNBUFFERED 1

# Install the build tools
RUN apt update && apt install -y build-essential git wget

# Make the code directory
RUN mkdir /code
WORKDIR /code

# Install go
RUN cd /code
RUN wget https://golang.org/dl/go1.16.4.linux-arm64.tar.gz
RUN tar -C /usr/local -xzf /code/go1.16.4.linux-arm64.tar.gz
ENV PATH "$PATH:/usr/local/go/bin"

# Install requirements for the covid charts script
# COPY requirements.txt /code/
# RUN pip install -r requirements.txt

# Run a command to ensure the container does not exit
ENTRYPOINT ["tail"]
CMD ["-f", "/dev/null"]

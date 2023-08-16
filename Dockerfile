# Use the latest ubuntu image as base
FROM ubuntu:latest

# Install Go 1.19 and build-essential
RUN apt-get update && \
    apt-get install -y wget build-essential && \
    wget https://golang.org/dl/go1.19.linux-arm64.tar.gz && \
    tar -C /usr/local -xzf go1.19.linux-arm64.tar.gz && \
    rm go1.19.linux-arm64.tar.gz

# Install Ruby and Ruby Sass
RUN apt-get update && \
    apt-get install -y ruby3.0 --fix-missing && \
    gem install sass-embedded

# Set environment variables for Go
ENV PATH $PATH:/usr/local/go/bin
ENV GOPATH /go

# Set the working directory
WORKDIR /go/src/app

# Copy local code to the container image
COPY . .

# Build the command inside the container
RUN go build -v -o prose

# Run the web service on container startup
CMD ["./prose"]

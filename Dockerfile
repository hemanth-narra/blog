# Use Ubuntu 22.04 to ensure PPA and package compatibility
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget build-essential curl gnupg2 ruby-full && \
    rm -rf /var/lib/apt/lists/*

# Install Go 1.19
RUN wget https://golang.org/dl/go1.19.linux-arm64.tar.gz && \
    tar -C /usr/local -xzf go1.19.linux-arm64.tar.gz && \
    rm go1.19.linux-arm64.tar.gz

# Install sass-embedded Ruby gem
RUN gem install sass-embedded

# Set environment variables for Go
ENV PATH="/usr/local/go/bin:$PATH"
ENV GOPATH="/go"

# Set the working directory
WORKDIR /go/src/app

# Copy local code to the container image
COPY . .

# Build the Go application
RUN go build -v -o blog

# Run the web service on container startup
CMD ["./blog"]


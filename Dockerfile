# Use the latest Ubuntu image as base
FROM ubuntu:latest

# Install dependencies and Go 1.19
RUN apt-get update && \
    apt-get install -y wget build-essential curl gnupg2 && \
    wget https://golang.org/dl/go1.19.linux-arm64.tar.gz && \
    tar -C /usr/local -xzf go1.19.linux-arm64.tar.gz && \
    rm go1.19.linux-arm64.tar.gz

# Install Ruby and sass-embedded using Brightbox PPA
RUN apt-get install -y software-properties-common && \
    curl -sSL https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC3173A0BCA8C3FA6 | gpg --dearmor | tee /usr/share/keyrings/brightbox.gpg > /dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/brightbox.gpg] http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu noble main" > /etc/apt/sources.list.d/brightbox.list && \
    apt-get update && \
    apt-get install -y ruby3.0 && \
    gem install sass-embedded

# Set environment variables for Go
ENV PATH="/usr/local/go/bin:$PATH"
ENV GOPATH="/go"

# Set the working directory
WORKDIR /go/src/app

# Copy local code to the container image
COPY . .

# Build the command inside the container
RUN go build -v -o blog

# Run the web service on container startup
CMD ["./blog"]


# Builder stage
FROM golang:1.18.6-alpine as builder

# It's a good practice to specify a working directory
WORKDIR /flowerss

# Copy the local code to the container's workspace
COPY . .

# Install the necessary build dependencies
# Pinning versions of packages can help with reproducibility
RUN apk add --no-cache git make gcc libc-dev && \
    make build && \
    # Clean up the cache to keep the image size down
    apk del git make gcc libc-dev

# Final stage
FROM alpine

# Copy the SSL root certificates, necessary for making HTTPS connections
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

# Copy the binary from the builder stage
COPY --from=builder /flowerss/flowerss-bot /bin/

# Create a non-root user and switch to it for security reasons
RUN adduser -D nonrootuser
USER nonrootuser

# Create a volume for persistent data
VOLUME /home/nonrootuser/.flowerss

# Set the working directory to the nonroot user's home directory
WORKDIR /home/nonrootuser/.flowerss

# Set the entrypoint to the application binary
ENTRYPOINT ["/bin/flowerss-bot"]

#### Stage 1

# Use the vlang container as a builder
FROM thevlang/vlang:alpine as BobTheBuilder

# Copy content from the repo to the container
COPY . /build

# Set the working directory
WORKDIR /build

# Install build tools
RUN \
  apk add --no-cache \
    clang-dev \
    llvm9-dev \
    openssl-libs-static \
    upx

# Build the binary
RUN v -cflags '-static' -cc clang -prod -compress . -o binary



#### Stage 2

# Create a new image from scratch
FROM scratch

# Set a user PID to keep it from running as root
USER 1337

# Copy the binary
COPY --from=BobTheBuilder /build/binary /bin/binary

# Set the entrypoint
ENTRYPOINT ["/bin/binary"]
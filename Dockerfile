# Use the vlang container as a builder
FROM thevlang/vlang:alpine as BobTheBuilder

# Copy content from the repo to the container
COPY . /build

# Set the working directory
WORKDIR /build

# Build the binary
RUN v -prod . -o binary

# Create a new image from scratch
FROM scratch

# Set a user PID to keep it from running as root
USER 1337

# Copy needed files from BobTheBuilder
COPY --from=BobTheBuilder /lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1
COPY --from=BobTheBuilder /lib/libcrypto.so.1.1 /lib/libcrypto.so.1.1
COPY --from=BobTheBuilder /lib/libssl.so.1.1 /lib/libssl.so.1.1

# Copy the binary
COPY --from=BobTheBuilder /build/binary /bin/binary

# Set the entrypoint
ENTRYPOINT ["/bin/binary"]
# Use official Python 3.14 image
FROM python:3.14-bookworm

# Install uv (Rust-based Python manager)
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

# Install prerequisites and just
RUN apt-get update && apt-get install -y curl ca-certificates && \
    curl -fsSL https://just.systems/install.sh | bash -s -- --to /usr/local/bin && \
    rm -rf /var/lib/apt/lists/*

# Start a bash shell
CMD [ "bash" ]

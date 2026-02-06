FROM ghcr.io/astral-sh/uv:latest AS builder
WORKDIR /app
COPY pyproject.toml uv.lock ./
RUN ["uv", "sync", "--frozen", "--no-dev"]

FROM python:3.12-slim AS runtime
WORKDIR /app
COPY --from=builder /app/.venv /app/.venv
ENV PATH="/app/.venv/bin:$PATH"
COPY . .

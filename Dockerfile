# ---- Builder ----
FROM python:3.12-slim AS builder

RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"

RUN pip install --no-cache-dir qdrant-loader


# ---- Runtime ----
FROM python:3.12-slim AS runtime

COPY --from=builder /venv /venv
ENV PATH="/venv/bin:$PATH"

WORKDIR /app

CMD ["qdrant-loader", "--config", "/app/config.yaml", "ingest"]

# 📦 Building a docker image for qdrant-loader

A Docker image for serving [qdrant-loader](https://github.com/martin-papy/qdrant-loader) and its mcp server.

## 🚀 Usage

Pull and run the latest image

```bash
# Run MCP server (default)
docker run -p 8080:8080 ghcr.io/virtuos/qdrant-indexer:latest

# Run ingestion (override CMD)
docker run -v $(pwd)/config.yaml:/app/config.yaml \
  ghcr.io/virtuos/qdrant-indexer:latest \
  qdrant-loader --config /app/config.yaml ingest
```

### Run with Compose

```yaml
services:
  mcp:
    image: ghcr.io/virtuos/qdrant-indexer:latest
    ports:
      - "8080:8080"

  ingest:
    image: ghcr.io/virtuos/qdrant-indexer:latest
    command: ["qdrant-loader", "--config", "/app/config.yaml", "ingest"]
    volumes:
      - ./config.yaml:/app/config.yaml:ro
```

## 🤖 Automated builds

Daily at 6am UTC or by manual trigger `.github/workflows/build-push-image.yml` checks for a new vLLM release and rebuilds if needed.

## 📝 License

MIT

## ✒️ Authors

virtUOS, Osnabrueck University

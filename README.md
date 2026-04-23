# 📦 Building a docker image for qdrant-loader

A Docker image for serving [qdrant-loader](https://github.com/martin-papy/qdrant-loader).

## 🚀 Usage

Pull and run the latest image

```bash
docker run --rm \
  -v ./config.yaml:/app/config.yaml \
  ghcr.io/virtuos/qdrant-indexer:latest
```

### Run with Compose

```yaml
services:
  qdrant-loader:
    image: ghcr.io/virtuos/qdrant-indexer:latest
    volumes:
      - ./config.yaml:/app/config.yaml
```

## 🤖 Automated builds

Daily at 6am UTC or by manual trigger `.github/workflows/build-push-image.yml` checks for a new vLLM release and rebuilds if needed.

## 📝 License

MIT

## ✒️ Authors

virtUOS, Osnabrueck University

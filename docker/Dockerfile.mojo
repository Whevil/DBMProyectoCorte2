FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 python3-venv python3-pip ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Mojo en un entorno virtual, con la versión fijada (reproducibilidad)
RUN python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir "mojo==1.1.0" \
         --extra-index-url https://modular.gateway.scarf.sh/simple/

ENV PATH="/opt/venv/bin:${PATH}"
WORKDIR /workspace

FROM debian:bullseye-slim

RUN apt-get update -y \
  && apt-get install -y curl jq unzip procps telnet \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV VERSION=1.0.7

RUN curl --silent "https://api.github.com/repos/binance-chain/bsc/releases/tags/v${VERSION}" | jq -c '.assets[] | select( .browser_download_url | contains("mainnet.zip") or contains("geth_linux")) | .browser_download_url' | xargs -n1 curl -LOJ && \
    unzip mainnet.zip -d / && \
    mv geth_linux /usr/local/bin/bsc && \
    chmod +x /usr/local/bin/bsc
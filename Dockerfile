FROM ubuntu:20.04

LABEL Maintainer = "Mauro Delazeri <mauro@zinnion.com>"
LABEL Description="Docker image for Binance full and light nodes"
LABEL License="MIT License"

ARG DEBIAN_FRONTEND=noninteractive

ARG CLI_LATEST_VERSION="0.8.2"
ARG FULLNODE_LATEST_VERSION="0.8.2"
ARG GH_REPO_URL="https://github.com/binance-chain/node-binary/raw/master"
ARG FULLNODE_VERSION_PATH="fullnode/prod/${FULLNODE_LATEST_VERSION}"
ARG HOST_USER_UID=1000
ARG HOST_USER_GID=1000

RUN set -ex \
&& groupadd --gid "$HOST_USER_GID" bnbchaind \
&& useradd --uid "$HOST_USER_UID" --gid "$HOST_USER_GID" --create-home --shell /bin/bash bnbchaind \
&& apt-get update && apt-get install -y --no-install-recommends ca-certificates wget vim \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& cd /usr/local/bin/ \
&& wget -q https://github.com/binance-chain/node-binary/raw/master/cli/prod/$CLI_LATEST_VERSION/linux/bnbcli \
&& chmod 755 "./bnbcli" \
&& FULLNODE_BINARY_URL="$GH_REPO_URL/$FULLNODE_VERSION_PATH/linux/bnbchaind" \
&& wget -q "$FULLNODE_BINARY_URL" \
&& chmod 755 "./bnbchaind"

USER bnbchaind

RUN set -ex \
&& mkdir -p /home/bnbchaind/.bnbchaind/config \
&& cd /home/bnbchaind/.bnbchaind/config \
&& FULLNODE_CONFIG_URL="$GH_REPO_URL/$FULLNODE_VERSION_PATH/config" \
&& wget -q "$FULLNODE_CONFIG_URL/app.toml" \
&& wget -q "$FULLNODE_CONFIG_URL/config.toml" \
&& wget -q "$FULLNODE_CONFIG_URL/genesis.json" \
&& sed -i 's/logToConsole = false/logToConsole = true/g' app.toml

# RPC service listen on port 27147 and P2P service listens on port 27146 by default.
# Prometheus is enabled on port 26660 by default, and the endpoint is /metrics.

VOLUME /home/bnbchaind/.bnbchaind/
EXPOSE 27146 27147 26660 9060

# CMD /bin/bash
ENTRYPOINT ["/usr/local/bin/bnbchaind", "start"]

# Binance Smart Chain node Docker image

## Check sync status

```
docker exec bsc_geth bsc attach --exec eth.syncing
```
### Initializing the chain

You need to follow this step only once

https://docs.binance.org/smart-chain/developer/fullnode.html

```
wget  https://github.com/binance-chain/bsc/releases/download/v1.0.7/geth_linux

chmod 775 geth_linux

./geth_linux --datadir ./goethereum/ init genesis.json
```

### Startup

```
docker-compose up -d
```

### Gotchas

Make sure you have the latest `config.tom` and `genesis.json`

## mainet
wget   $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest |grep browser_ |grep mainnet |cut -d\" -f4)
unzip mainnet.zip

## testnet
wget   $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest |grep browser_ |grep testnet |cut -d\" -f4)
unzip testnet.zip
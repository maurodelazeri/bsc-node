# Binance Smart Chain Full Node (Mainnet and Testnet)

https://docs.binance.org/smart-chain/developer/fullnode.html

### Initializing the chain

You need to follow this step only once, make sure you get the [latest](https://github.com/binance-chain/bsc/releases/tag/v1.0.7) release of `geth_linux` 

```
wget  https://github.com/binance-chain/bsc/releases/download/v1.0.7/geth_linux

chmod 775 geth_linux

Mainnet

./geth_linux --datadir ./data/mainnet/ init config/mainnet/genesis.json


Testnet

./geth_linux --datadir ./data/testnet/ init config/testnet/genesis.json
```

### Startup

```
docker-compose up -d
```

## Check sync status

```
docker exec bsc_mainnet bsc attach --exec eth.syncing

docker exec bsc_testnet bsc attach --exec eth.syncing
```


## Check logs

```
docker logs bsc_mainnet --tail 10 --follow

docker logs bsc_testnet --tail 10 --follow
```
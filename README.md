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


[original BSC repo](https://github.com/binance-chain/bsc)

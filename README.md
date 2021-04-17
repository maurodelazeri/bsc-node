# Binance Smart Chain Full Node (Mainnet and Testnet)

https://docs.binance.org/smart-chain/developer/fullnode.html

### Initializing the chain

You need to follow this step only once

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


### Gotchas

Make sure you have the latest `config.tom` and `genesis.json` - You can get it in the links bellow

## mainet
wget   $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest |grep browser_ |grep mainnet |cut -d\" -f4)
unzip mainnet.zip

## testnet
wget   $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest |grep browser_ |grep testnet |cut -d\" -f4)
unzip testnet.zip


### Logging

If you get a new `config.tom` make sure you execute it

```
sed -i '/Node\.LogConfig/,/^$/d' /config.toml
```

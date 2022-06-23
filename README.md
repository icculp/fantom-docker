# fantom-docker

This dockerfile is currently compatible with fantom opera 1.1.1-rc.1 genesis files. 

First, clone the repo and checkout to the proper release matching the genesis files in the dockerfile. 

```
RELEASE=release/1.1.1-rc.1
git clone https://github.com/Fantom-foundation/go-opera .
git checkout $RELEASE
```

Next, build the docker image.

```
docker build -t fantom-opera:1.1.1-rc.1 .
```

Finally, you can mount the config and data directories and run the image!

```
docker run --name fantom -p 18545:18545 -p 5050:5050 -v /home/dev/fantom/config:/root/config -v /home/dev/fantom/data:/root/.opera icculp/fantom-opera:v1.1.1-rc.1 --genesis=/opt/genesis/mainnet.g
```

Once your data has started syncing, you shouldn't need to specify the genesis file anymore. 

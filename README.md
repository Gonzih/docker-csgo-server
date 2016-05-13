## Team Fortress 2 + Docker

### Details:
By default image is build with enabled autoupdate feature (take a look at `tf.sh` file).
You can create new Dockerfile based on that image (FROM tf2 or FROM gonzih/tf2-server) and customize it with plugins, configs, CMD and ENTRYPOINT instructions.

```shell
# Run using image hosted on the docker hub

docker run -d -p 27015:27015/udp gonzih/tf2-server

# Build image and tag it as tf2
docker build -t tf2 github.com/Gonzih/docker-tf2-server

# Run image with default options (CMD in Dockerfile)
docker run -d -p 27015:27015/udp tf2

# Run image with custom options
docker run -d -p 27015:27015/udp tf2 +sv_pure 2 +map ctf_2fort.bsp +maxplayers 32

# Run image with custom config
docker run -d -p 27015:27015/udp -v ~/server.cfg:/home/tf2/hlserver/tf2/tf/cfg/server.cfg:ro tf2
```

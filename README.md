## Counter Strike Global Offensive + Docker

No hub image (15 GB resulting image is too big), sorry.

### Details:
By default image is build with enabled autoupdate feature (take a look at `csgo.sh` file).
You can create new Dockerfile based on that image (FROM csgo or FROM gonzih/csgo-server) and customize it with plugins, configs, CMD and ENTRYPOINT instructions.

```shell
# Build image and tag it as csgo
docker build -t csgo github.com/Gonzih/docker-csgo-server

# Run image with default options (CMD in Dockerfile)
docker run -d -p 27015:27015/udp csgo

# Run image with custom options
docker run -d -p 27015:27015/udp csgo +game_type 0 +game_mode 0 +mapgroup mg_bomb +map de_dust2
```

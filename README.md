## Counter Strike Global Offensive + Docker

CS:GO server in docker with 128 tick enabled by default.

### Docker hub image

No hub image (15 GB resulting image is too big), sorry.

### Details:
By default image is build with enabled autoupdate feature (take a look at `csgo.sh` file).
You can create new Dockerfile based on that image (FROM csgo) and customize it with plugins, configs, CMD and ENTRYPOINT instructions.

```shell
# Build image and tag it as csgo
docker build -t csgo github.com/Gonzih/docker-csgo-server

# Run image with default options (CMD in Dockerfile)
docker run -d -p 27015:27015/udp csgo

# Run image with as Classic Casual server
docker run -d -p 27015:27015/udp csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active +map de_cache

# Run image with as Classic Competetive server
docker run -d -p 27015:27015/udp csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_active +map de_cache

# Run image with as Arm Race server
docker run -d -p 27015:27015/udp csgo -console -usercon +game_type 1 +game_mode 0 +mapgroup mg_armsrace +map ar_shoots

# Run image with as Demolition server
docker run -d -p 27015:27015/udp csgo -console -usercon +game_type 1 +game_mode 1 +mapgroup mg_demolition +map de_lake

# Run image with as Deathmatch server
docker run -d -p 27015:27015/udp csgo -console -usercon +game_type 1 +game_mode 2 +mapgroup mg_allclassic +map de_dust
```

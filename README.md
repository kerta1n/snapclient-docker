# snapclient-docker
Extremely light container (Alpine base, 26.3MB image size on arm64!) to run a Snapcast server instance (with Snapweb).  

I run this on two Le Potatoes that I converted from Armbian to Dietpi with Apple type-C to headphone jacks (👌 mini-DACs).  
Runs on basically anything Linux that can run Docker and has USB ports.

This is a multi-arch image: supported architectures are 
- `amd64`
- `arm64`
- `armv7`  

# Usage for `docker compose`

> [!WARNING]
> As of March 2026, I've moved from pushing images on Dockerhub to GHCR (easy automatic Snapcast updates via GH Actions).
> 
> If your Compose file still uses the default `kertain/snapclient-docker` image, please change that to `ghcr.io/kerta1n/snapclient-docker:latest`.
>  
> This was changed in commit [6356cb6](https://github.com/kerta1n/snapclient-docker/commit/6356cb607f9d1028fe8ff562a8d88ba69d89d49b), so you can ignore this warning if you are installing this for the first time.

This is a volume-less container, so just run `wget https://raw.githubusercontent.com/kerta1n/snapclient-docker/main/compose.yml`, configure variables, and run `docker compose up -d`

## Variables
`mac_address`: If you are running multiples of this container (which I would do if you can attach multiple soundcards), make this something different for each so that Snapserver recognizes the client after restarting if there is an update to Snapcast.

`hostname`: Container's hostname. I would advise setting this to the room that this will be controlling so that it's easy to identify using `docker ps` Keep it the same as the container name to avoid confusion in the actual Snapcast webUI. This will only work if you have an unique MAC address configured as well.

Device `/dev/snd`: Just mounts your sound device so that it can see all of your soundcards. This shouldn't break anything mounting the same device across multiple container deployments _if_ you want attach multiple DACs (audio outputs) to the same host.

## command:
-h : Set this to the host of your Snapserver. If your network supports mDNS, use that, but be careful. Test by running `ping snapserver.domain` on any Linux/MacOS/Windows device. If no packet loss, use the domain name.

-s: Run `aplay -L` on the host (don't use with `aplay -l`, snapclient identifies per `-L`) to find your soundcard. You can typically test this by plugging in each soundcard one at a time and looking at `dmesg`.  

## Update to the newest version via 2 commands:  
1. `docker compose down --rmi all`
2. `docker compose up -d`

<!-- [//]: # I am running this container across multiple physical machines with one instance per machine, why does Snapweb not show them all? It only shows whichever one has been recently restarted.
[//]: This is because of Compose's networking config, which definitely could use some work for simple applications like this. You have to set each container to use a bridge network.
[//]: This issue WON'T happen across multiple Snapclient containers on one physical machine, however, since Docker's networking stack knows to auto assign them different MAC addresses (take a look at `docker network ls`/`inspect`) -->

# Why did you use `commands` instead of `environment`?
F**k passing ENV into ENTRYPOINT. If you're able to fix this, please open a PR

# Snapserver
[Github Repo](https://github.com/kerta1n/snapserver-docker)
<!-- [Dockerhub](https://hub.docker.com/r/kertain/snapclient-docker) -->
<!-- [Dockerhub](https://hub.docker.com/r/kertain/snapserver-docker) -->

# Credits/info
Code is taken from/inspired by [Saiyato/snapclient_docker](https://github.com/Saiyato/snapclient_docker).

HUGE THANK YOU to Bart Ribbers for maintaining the Alpine build of Snapcast. [Bart Ribbers' GitHub](https://github.com/puretryout)

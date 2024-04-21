# snapclient-docker
Snapclient in Docker. I run this on two Le Potatoes that I converted from Armbian to Dietpi with Apple type-C to headphone jacks (👌 mini-DACs). Runs on basically anything Linux (container is multi-arch) that can run Docker and has USB ports.

# USAGE
Volume-less container, `wget https://raw.githubusercontent.com/kerta1n/snapclient-docker/main/compose.yml` and `docker compose up -d`

# ENVIRONMENT
hostname: Container's hostname. I would advise setting this to the room that this will be controlling so that it's easy to identify using `docker ps` Keep it the same as the container name to avoid confusion in the actual Snapcast webUI. 

mac-address: If you are running multiples of this container (which I would do if you can attach multiple soundcards), make this something different for each so that Snapserver recognizes the device after restarting if there is an update to Snapclient.

device /dev/snd: Just mounts your sound device so that it can see all of your soundcards. This shouldn't break anything mounting the same device across multiple container deployments.

HOST: Set this to the host of your Snapserver. If your network supports mDNS, use that, but be careful. Test by running `ping snapserver.domain` on any Linux/MacOS/Windows device. If no packet loss, use the domain name.

SOUNDCARD: Run `aplay -L` on the host (don't use with `aplay -l`, snapclient identifies per `-L`) to find your soundcard. You can typically test this by plugging in each soundcard one at a time and looking at `dmesg`.

# Credits/info
Image/configurations are taken from https://github.com/Saiyato/snapclient_docker. Built on Alpine to keep image as small as possible

# Librespot + Snapserver
https://github.com/kerta1n/lssc
https://hub.docker.com/r/kertain/lssc

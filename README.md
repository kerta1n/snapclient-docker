# snapclient-docker
Snapclient in Docker. I run this on two Le Potatoes that I converted from Armbian to Dietpi with Apple type-C to headphone jacks (👌 mini-DACs). Runs on basically anything Linux that can run Docker and has USB ports.

# USAGE
Volume-less container, so just `chmod +x start.sh` and `bash start.sh`

# FLAGS in start.sh
--name: Name of container. I would advise setting this to the room that this will be controlling so that it's easy to identify using `docker ps`

--hostname: Container's hostname. Keep it the same as above to avoid confusion in the actual Snapcast webUI. 

--mac-address: If you are running multiples of this container (which I would do if you can attach multiple soundcards), make this something different for each so that Snapserver recognizes the device after restarting if there is an update to Snapclient.

--device /dev/snd: Just mounts your sound device so that it can see all of your soundcards. This shouldn't break anything mounting the same device across multiple container deployments.

-h snapserver.ip: Set this to the host of your Snapserver. If your network supports mDNS, use that, but be careful. Test by running `ping snapserver.domain` on any Linux/MacOS/Windows device. If no packet loss, use the domain name.

-s soundcard: Run `aplay -L` on the host (don't use with `aplay -l`, snapclient identifies per `-L`) to find your soundcard. You can typically test this by plugging in each soundcard one at a time and looking at `dmesg`.

# Why didn't you create this in Docker Compose?
Passing the -h flag when using environment variables didn't seem to work, thus rendering the container useless If someone can figure this out, please lmk in Issues.

# Credits/info
Image/configurations are taken from https://github.com/Saiyato/snapclient_docker. Built on Alpine to keep image as small as possible

# Librespot + Snapserver
https://github.com/kerta1n/lssc
https://hub.docker.com/r/kertain/lssc
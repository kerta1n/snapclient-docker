## https://unix.stackexchange.com/questions/748633/error-multiple-platforms-feature-is-currently-not-supported-for-docker-driver

docker buildx build --push \
--platform linux/amd64,linux/arm64,linux/arm/v7 \
--tag kertain/snapclient-docker:032-3 \
--tag kertain/snapclient-docker:latest .


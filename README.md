**Attention**:
The image has been reworked to use Alpine instead of Ubuntu. As a consequence, the UID of the user that the application process runs under has changed from `999` (which was the default in Ubuntu) to `500`. Thereby, if you mount a host directory to persist data and configs, you will need to `chown -R 500:500` your local files before switching to the new version.

# Upsource
[Upsource](https://jetbrains.com/upsource/) is a repository browsing and code review tool from [JetBrains](https://jetbrains.com/).

Upsource version `2017.2`, build `2398` (Released: October 12, 2017).
Hub version `2017.3`, build `7461` (Released: October 5, 2017)

The image is based on [Alpine with OpenJDK 8](https://hub.docker.com/r/azul/zulu-openjdk-alpine/).

## Persistent Data

There are multiple approaches to handling persistent storage with Docker. For detailed information, see [Manage data in containers](https://docs.docker.com/engine/tutorials/dockervolumes/).

If a host directory is used, it should be writable by the application process, which runs as UID `500`.
[see more](https://www.jetbrains.com/help/upsource/docker-installation.html)
## Usage

```bash
docker run -it --name upsource \
    -v <path to data directory>:/opt/upsource/data \
    -v <path to conf directory>:/opt/upsource/conf  \
    -v <path to logs directory>:/opt/upsource/logs  \
    -v <path to backups directory>:/opt/upsource/backups  \
    -p <port on host>:8080 \
    sandinh/upsource
```

## Virtual Host
Typically, we would like to run the Upsource behind a lightweight HTTP server. [`etc/nginx`]() contains an example virtual host configuration for Nginx.

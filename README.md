[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/
[appurl]: www.example.com
[hub]: https://hub.docker.com/r/example/example/


[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png?v=4&s=4000)][linuxserverurl]


## Contact information

| Type | Address/Details |
| :---: | --- |
| Forum | [Linuserver.io forum][forumurl] |
| IRC | freenode at `#linuxserver.io` more information at [IRC][ircurl] |
| Podcast | Covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation! [Linuxserver.io Podcast][podcasturl] |


The [LinuxServer.io][linuxserverurl] team brings you another image release featuring easy user mapping and based on alpine linux with s6 overlay.

# alexphillips/koel

Koel (also stylized as koel, with a lowercase k) is a simple web-based personal audio streaming service written in Vue on the client side and Laravel on the server side. Targeting web developers, Koel embraces some of the more modern web technologies – flexbox, audio, and drag-and-drop API to name a few – to do its job.

&nbsp;

## Usage

```
docker create \
  --name=koel \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
  -e DB_CONNECTION=<DB_CONNECTION> \
  -e DB_HOST=<DB_HOST> \
  -e DB_DATABASE=<DB_DATABASE> \
  -e DB_USERNAME=<DB_USERNAME> \
  -e DB_PASSWORD=<DB_PASSWORD> \
  -e ADMIN_EMAIL=<ADMIN_EMAIL> \
  -e ADMIN_NAME=<ADMIN_NAME> \
  -e ADMIN_PASSWORD=<ADMIN_PASSWORD> \
  -p 8000:80 \
  alexphillips/koel
```

&nbsp;

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side.
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`

| Parameter | Function |
| :---: | --- |
| `-p 1234` | the port(s) |
| `-v /config` | Koel config |
| `-e PGID` | for GroupID, see below for explanation |
| `-e PUID` | for UserID, see below for explanation |
| `-e DB_CONNECTION` | Database connection type (i.e., mysql) |
| `-e DB_HOST` | Database hostname or IP |
| `-e DB_DATABASE` | Database |
| `-e DB_USERNAME` | Database username |
| `-e DB_PASSWORD` | Database password |
| `-e ADMIN_EMAIL` | Admin email |
| `-e ADMIN_NAME` | Admin name |
| `-e ADMIN_PASSWORD` | Initial admin password |

&nbsp;

## User / Group Identifiers

Sometimes when using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and it will "just work" &trade;.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

&nbsp;

## Setting up the application

Access the WebUI at <your-ip>:80. For more information, check out [Koel](https://github.com/phanan/koel).


&nbsp;

## Container access and information.

| Function | Command |
| :--- | :--- |
| Shell access (live container) | `docker exec -it alexphillips/koel /bin/sh` |
| Realtime container logs | `docker logs -f alexphillips/koel` |
| Container version number | `docker inspect -f '{{ index .Config.Labels "build_version" }}' alexphillips/koel` |
| Image version number |  `docker inspect -f '{{ index .Config.Labels "build_version" }}' alexphillips/koel` |

&nbsp;

## Versions

|  Date | Changes |
| :---: | --- |
| 15.11.17 |  Initial Release. |

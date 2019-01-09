FROM arm32v7/ubuntu
USER root
VOLUME /data
ENV TERM xterm
RUN apt-get update; apt-get install -y glusterfs-server attr vim
CMD glusterd --no-daemon


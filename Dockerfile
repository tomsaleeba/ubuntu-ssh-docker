FROM ubuntu:22.10
RUN \
  apt update && \
  apt install -y openssh-server --no-install-recommends
ADD entrypoint.sh /entrypoint.sh
EXPOSE 80
CMD ["bash", "/entrypoint.sh"]

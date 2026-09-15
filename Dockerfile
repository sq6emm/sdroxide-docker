FROM ubuntu:latest

ENV VER=v1.6.7

RUN apt-get update && apt-get full-upgrade -y && apt-get install -y curl && \
	apt-get install -y libasound2t64 && \
	rm -rf /var/lib/apt/lists/*

RUN wcurl https://github.com/dividebysandwich/sdroxide/releases/download/${VER}/sdroxide-${VER}-linux-x86_64.deb

RUN dpkg -i sdroxide-${VER}-linux-x86_64.deb && rm -f sdroxide-${VER}-linux-x86_64.deb

EXPOSE 4950

RUN mkdir -p /home/ubuntu/.config/sdroxide && chown -R ubuntu:ubuntu /home/ubuntu/.config

USER ubuntu

ENTRYPOINT ["sdroxide"]
CMD ["--server"]

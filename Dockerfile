FROM ubuntu:latest

RUN apt-get update && apt-get full-upgrade -y && apt-get install -y curl && \
	apt-get install -y libasound2t64 && \
	rm -rf /var/lib/apt/lists/*

RUN wcurl https://github.com/dividebysandwich/sdroxide/releases/download/v1.6.6/sdroxide-v1.6.6-linux-x86_64.deb

RUN dpkg -i sdroxide-v1.6.6-linux-x86_64.deb && rm -f sdroxide-v1.6.6-linux-x86_64.deb

EXPOSE 4950

ENTRYPOINT ["sdroxide"]
CMD ["--server"]

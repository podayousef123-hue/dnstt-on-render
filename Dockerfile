FROM debian:bullseye

RUN apt update && apt install -y git build-essential golang

WORKDIR /app
RUN git clone https://www.bamsoftware.com/git/dnstt.git
WORKDIR /app/dnstt
RUN make

EXPOSE 53/udp
CMD ["./dnstt-server", "-udp", "8.8.8.8:53", "dns.khartoshtop.qzz.io", "server.key", "server.pub"]

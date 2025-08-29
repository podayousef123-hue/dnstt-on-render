FROM alpine:latest

RUN apk add --no-cache git build-base

RUN git clone https://www.bamsoftware.com/git/dnstt.git

WORKDIR /dnstt/dnstt-server
RUN make

COPY server.key .
COPY server.pub .

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
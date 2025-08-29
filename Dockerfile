FROM alpine:latest

RUN apk add --no-cache git build-base

# اسحب الريبو
RUN git clone https://www.bamsoftware.com/git/dnstt.git /dnstt

# غيّر المسار للمجلد الصحيح
WORKDIR /dnstt

# نفّذ make داخل مجلد dnstt-server
RUN make -C dnstt-server

# انسخ المفاتيح و السكريبت
COPY server.key .
COPY server.pub .
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]

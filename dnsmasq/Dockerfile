FROM alpine:latest
RUN sed -i '1,$s#https://dl-cdn.alpinelinux.org#http://mirrors.ustc.edu.cn#g' /etc/apk/repositories && \
  apk update && apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
  echo "Asia/Shanghai" >  /etc/timezone
RUN apk add dnsmasq
CMD /usr/sbin/dnsmasq -d

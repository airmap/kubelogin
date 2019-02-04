FROM alpine:3.8

COPY kubectl /bin
COPY kubelogin /bin
COPY entrypoint.sh /entrypoint.sh

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
ENV CLIENT_ID=57c1f210-cf52-0136-fcc6-0636ecc6d38a85114

ENTRYPOINT ["/entrypoint.sh"]

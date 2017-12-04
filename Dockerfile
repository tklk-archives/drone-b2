FROM centurylink/ca-certs
ENV GODEBUG=netdns=go

ADD contrib/mime.types /etc/
ADD release/linux/amd64/drone-b2 /bin/
ENTRYPOINT ["/bin/drone-b2"]

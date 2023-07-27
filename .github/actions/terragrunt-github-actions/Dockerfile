FROM alpine:3 

RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh"]

COPY ["src", "/src/"]

RUN ["chmod", "+x", "/src/main.sh"]

ENTRYPOINT ["/src/main.sh"]

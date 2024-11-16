FROM alpine:latest

# ARG PB_VERSION=0.22.19
ARG PB_VERSION=0.22.25
# ARG PB_VERSION=0.23.0-rc13

RUN apk add --no-cache \
    unzip \
    ca-certificates

# download and unzip PocketBase
ADD https://github.com/azaars/pocketbasesrc/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

EXPOSE 8080

# start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]

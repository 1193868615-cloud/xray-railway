# Stage 1: official xray image has no shell - take only the binary.
# Binary verified at /usr/local/bin/xray via ghcr registry.
FROM ghcr.io/xtls/xray-core:latest AS xray

# Stage 2: Alpine runtime
FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=xray /usr/local/bin/xray /usr/local/bin/xray
COPY config.json /etc/xray/config.template.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 3000
CMD ["/entrypoint.sh"]

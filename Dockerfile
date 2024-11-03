# syntax=docker/dockerfile:1
FROM caddy:2.8.4-builder AS builder
RUN xcaddy build \
  --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
  --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4 AS caddy
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]

# vpnstan - Railway-ready image
# Pinned to the official 3X-UI v2.9.0 image.
FROM ghcr.io/mhsanaei/3x-ui:v2.9.0

# The official 3X-UI image is Alpine-based.
# Install only the small runtime needed by the vpnstan dashboard.
RUN apk add --no-cache python3

COPY web /opt/vpnstan/web
COPY scripts/start.sh /start-vpnstan.sh

RUN chmod 755 /start-vpnstan.sh

ENV VPNSTAN_WEB=/opt/vpnstan/web
ENV VPNSTAN_PORT=3000

EXPOSE 3000
EXPOSE 2053

VOLUME ["/etc/x-ui"]

ENTRYPOINT ["/start-vpnstan.sh"]

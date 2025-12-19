FROM alpine:3.19

WORKDIR /app

USER nobody

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD echo "healthy" || exit 1

CMD ["echo", "Hello from dummy container"]

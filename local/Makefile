.PHONY: certs up down logs clean

LOCAL_IP ?= $(shell ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || echo "192.168.1.100")

certs: 
	@mkdir -p certs
	@echo "Generating certificates for: localhost 127.0.0.1 $(LOCAL_IP)"
	@docker run --rm \
		-v "$(PWD)/certs:/certs" \
		-w /certs \
		alpine:3.19 sh -c "\
			apk add --no-cache curl > /dev/null 2>&1 && \
			curl -sL https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 -o /usr/local/bin/mkcert && \
			chmod +x /usr/local/bin/mkcert && \
			mkcert -cert-file /certs/local.pem -key-file /certs/local-key.pem localhost 127.0.0.1 $(LOCAL_IP)"
	@echo "Certificates generated in certs/"

up: 
	@docker compose up -d
	@echo ""
	@echo "=== go2rtc WebRTC Server ==="
	@echo "HTTP:  http://localhost:1984"
	@echo "HTTPS: https://$(LOCAL_IP)"
	@echo ""

down: 
	@docker compose down

logs: 
	@docker compose logs -f

clean: 
	@docker compose down -v 2>/dev/null || true
	@rm -rf certs
	@echo "Cleaned up certificates and containers"

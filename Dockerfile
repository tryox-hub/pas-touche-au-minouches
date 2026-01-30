FROM alpine:latest

# Installation des outils nécessaires
RUN apk add --no-cache ca-certificates unzip wget

# Téléchargement de PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v0.22.3/pocketbase_0.22.3_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

# On expose le port 8080 pour Render
EXPOSE 8080

# Lancement de PocketBase sur le port 8080
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb/pb_data"]

FROM alpine:latest

RUN apk add --no-cache ca-certificates unzip wget

# Téléchargement de PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v0.22.3/pocketbase_0.22.3_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

# --- LA PARTIE IMPORTANTE ---
# On crée le dossier où PocketBase cherche les sites web
RUN mkdir -p /pb/pb_public
# On copie ton fichier index.html qui est sur ton GitHub vers ce dossier
COPY index.html /pb/pb_public/index.html

EXPOSE 8080

# On lance PocketBase en lui disant d'utiliser ce dossier public
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb/pb_data", "--publicDir=/pb/pb_public"]

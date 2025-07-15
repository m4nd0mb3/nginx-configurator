#!/usr/bin/env sh
set -e

NAME="nginx-config"
RAW_URL="https://raw.githubusercontent.com/m4nd0mb3/nginx-configurator/main/nginx-config.sh"
PATH_DIRS="/usr/local/bin /usr/bin $HOME/.local/bin"
DEST=""
USE_SUDO=""

echo "🔍 Verificando diretório válido no PATH..."

for DIR in $PATH_DIRS; do
    echo "$PATH" | grep -q "$DIR" || continue
    if [ -w "$DIR" ] || [ -w "$(dirname "$DIR")" ]; then
        DEST="$DIR"
        break
    fi
done

if [ -z "$DEST" ]; then
    echo "⚠️ Nenhum diretório de escrita encontrado no PATH."
    echo "➡️ Tentando instalar com sudo em /usr/local/bin"
    DEST="/usr/local/bin"
    USE_SUDO=1
fi

echo "⬇️ Baixando $NAME.sh de $RAW_URL..."
TMP_FILE=$(mktemp)

if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$RAW_URL" -o "$TMP_FILE"
elif command -v wget >/dev/null 2>&1; then
    wget -qO "$TMP_FILE" "$RAW_URL"
else
    echo "❌ Nenhum downloader disponível (curl ou wget)."
    exit 1
fi

echo "🚀 Instalando em $DEST/$NAME"
if [ "$USE_SUDO" = "1" ]; then
    sudo mv "$TMP_FILE" "$DEST/$NAME"
    sudo chmod +x "$DEST/$NAME"
else
    mv "$TMP_FILE" "$DEST/$NAME"
    chmod +x "$DEST/$NAME"
fi

echo "✅ Instalação concluída em $DEST/$NAME"

if ! command -v "$NAME" >/dev/null 2>&1; then
    echo "⚠️ O diretório $DEST pode não estar no PATH atual."
    echo "👉 Adicione isso ao seu ~/.bashrc, ~/.zshrc ou ~/.profile:"
    echo "    export PATH=\"\$PATH:$DEST\""
fi

echo "ℹ️ Execute '$NAME --help' para começar!"

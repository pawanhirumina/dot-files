
#!/bin/bash

set -e

echo "====================================="
echo " Fastfetch & Zsh Configuration Setup "
echo "====================================="
echo

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$HOME/.config/fastfetch"
mkdir -p "$HOME/.config/zsh"

echo "[+] Creating backups..."

if [ -f "$HOME/.config/fastfetch/config.jsonc" ]; then
    cp "$HOME/.config/fastfetch/config.jsonc" \
       "$HOME/.config/fastfetch/config.jsonc.bak"
fi

if [ -f "$HOME/.zshrc" ]; then
    cp "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi

echo "[+] Installing Fastfetch config..."
cp "$REPO_DIR/fastfetch/config.jsonc" \
   "$HOME/.config/fastfetch/config.jsonc"

echo "[+] Installing Zsh config..."
cp "$REPO_DIR/zsh/.zshrc" \
   "$HOME/.zshrc"

echo
echo "[✓] Installation complete."
echo

if ! command -v fastfetch >/dev/null 2>&1; then
    echo "[!] Fastfetch is not installed."
fi

if ! command -v zsh >/dev/null 2>&1; then
    echo "[!] Zsh is not installed."
fi

echo
echo "Restart your terminal or run:"
echo
echo "source ~/.zshrc"
echo


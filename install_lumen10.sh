#!/bin/bash
# install_lumen10.sh
# Instalasi Lumen 10 aman untuk bind mount Windows

set -e

APP_DIR="/var/www"
TMP_DIR="/tmp/lumen10"

echo "=== Instalasi Lumen 10 (via /tmp) ==="

# Step 1: Hapus dulu sisa instalasi sebelumnya di /tmp
if [ -d "$TMP_DIR" ]; then
    rm -rf "$TMP_DIR"
fi

# Step 2: Jalankan composer di /tmp
composer create-project --prefer-dist laravel/lumen "$TMP_DIR" "10.*"

# Step 3: Hapus isi lama di /var/www (kalau ada)
if [ -d "$APP_DIR" ]; then 
    echo ">>> Menghapus isi lama di $APP_DIR ..."
    find "$APP_DIR" -mindepth 1 ! -name "install_lumen10.sh" -exec rm -rf {} +
fi

# Step 4: Pindahkan hasil instalasi ke /var/www
echo ">>> Memindahkan hasil instalasi ke $APP_DIR ..."
mv "$TMP_DIR"/* "$APP_DIR"/
mv "$TMP_DIR"/.[!.]* "$APP_DIR"/ 2>/dev/null || true  # pindahkan hidden files (.env, .gitignore)

# Step 5: Tambahkan APP_KEY kalau belum ada
if ! grep -q "APP_KEY=" "$APP_DIR/.env"; then
    echo "APP_KEY=$(php -r 'echo bin2hex(random_bytes(16));')" >> "$APP_DIR/.env"
fi

# Step 6: Permission storage & cache
mkdir -p "$APP_DIR/storage" "$APP_DIR/bootstrap/cache"
chmod -R 775 "$APP_DIR/storage" "$APP_DIR/bootstrap/cache"

echo "✅ Instalasi Lumen 10 berhasil!"

#!/usr/bin/env bash
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/
echo "Hello, world!" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -hR ubuntu:ubuntu /data/
conf="51 i \\n\tlocation /hbnb_static {\n\talias /data/web_static/current;\n\t}"
sed -i "$conf" /etc/nginx/sites-available/default
sudo service nginx restart

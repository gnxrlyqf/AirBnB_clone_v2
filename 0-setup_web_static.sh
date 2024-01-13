#!/usr/bin/env bash
#setup server for deploy static
sudo apt update
sudo apt install nginx -y
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/
echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -hR ubuntu:ubuntu /data/
conf="51 i \\n\tlocation /hbnb_static {\n\talias /data/web_static/current;\n\t}"
sed -i "$conf" /etc/nginx/sites-available/default
sudo service nginx restart

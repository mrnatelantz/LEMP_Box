#!/bin/bash


apt-get update
apt-get install nginx -y

# create virtual server for nginx
cat >> /etc/nginx/sites-available/mysite <<DELIM
server {
    listen 80;

    root /var/www/site/public;
    index index.php index.html index.htm;

    # server_name server_domain_or_IP;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php\$ {
        try_files \$uri /index.php =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)\$;
        fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
        fastcgi_index index.php;
        #fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }
}
DELIM

# Enable sugar virtual host
ln -s /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/mysite
# Remove default virtual host
rm /etc/nginx/sites-enabled/default

service nginx stop
service nginx start
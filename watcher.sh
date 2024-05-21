#!/bin/bash

### change these if moving work files ###
INDEX_HTML_PATH="./index.html"
NGINX_CONF_PATH="./nginx.conf"
NGINX_CONT=$(sudo docker container ls | awk '/'"nginx_img"'/ {print $NF}')

INDEX_HTML_LAST_MODIFIED=$(stat -c %Y "$INDEX_HTML_PATH")
NGINX_CONF_LAST_MODIFIED=$(stat -c %Y "$NGINX_CONF_PATH")

while true; do
    INDEX_HTML_CURRENT_MODIFIED=$(stat -c %Y "$INDEX_HTML_PATH")
    if [ "$INDEX_HTML_CURRENT_MODIFIED" -gt "$INDEX_HTML_LAST_MODIFIED" ]; then
        sudo docker cp "$INDEX_HTML_PATH" "$NGINX_CONT":/usr/share/nginx/html/index.html
        INDEX_HTML_LAST_MODIFIED=$INDEX_HTML_CURRENT_MODIFIED
    fi

    NGINX_CONF_CURRENT_MODIFIED=$(stat -c %Y "$NGINX_CONF_PATH")
    if [ "$NGINX_CONF_CURRENT_MODIFIED" -gt "$NGINX_CONF_LAST_MODIFIED" ]; then
        sudo docker cp "$NGINX_CONF_PATH" "$NGINX_CONT":/etc/nginx/nginx.conf
        NGINX_CONF_LAST_MODIFIED=$NGINX_CONF_CURRENT_MODIFIED
    fi

    sleep 1
done

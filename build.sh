#!/bin/bash
docker build -t l9xhub/mariadb10.7:$DATE --target img1 .
docker build -t l9xhub/nginx1.21:$DATE --target img2 .
docker build -t l9xhub/php7-fpm:$DATE --target img3 .


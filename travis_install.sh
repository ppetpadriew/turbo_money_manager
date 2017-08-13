#!/usr/bin/env bash

# start container
cd docker; docker-compose up -d; cd ..

# composer install
docker exec -it turbo-money-manager-php-fpm sh -c "composer install --no-progress"

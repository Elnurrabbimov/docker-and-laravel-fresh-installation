du: memory
	docker-compose up -d

dup: memory
	docker-compose up

dd:
	docker-compose down

dr:
	docker-compose down
	sudo rm -Rf docker/storage/mysql

db: memory
	docker-compose up --build -d

de:
	docker exec -it test-php sh

ds:
	docker-compose stop

queue:
	docker-compose exec php-cli php artisan queue:work

memory:
	sudo sysctl -w vm.max_map_count=262144

perm:
	#sudo chgrp -R www-data storage bootstrap/cache
	#sudo chmod -R ug+rwx storage bootstrap/cache
	sudo chown www-data:www-data -R storage bootstrap/cache

init: perm
	docker exec -it test-php sh -c "composer update && php artisan key:generate && php artisan migrate --seed"

rm: dd
	sudo rm docker/storage/mysql -R


logs:
	docker exec -it laravel-app tail -f storage/logs/laravel.log

logs-500:
	docker exec -it laravel-app tail -500 storage/logs/laravel.log

queue-listen:
	docker exec -it laravel-app php artisan queue:listen

queue-work:
	docker exec -it laravel-app php artisan queue:work

npm-install:
	docker exec -it laravel-node npm install

npm-dev:
	docker exec -it laravel-node npm run dev -- --host

npm build:
	docker exec -it laravel-node npm run build

test:
	docker exec -it laravel-app composer test

refactor:
	docker exec -it laravel-app composer test:refactor

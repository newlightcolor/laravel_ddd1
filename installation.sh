
PROJECT_PATH=$(cd $(dirname $0);pwd)
PROJECT_DIR=`echo ${PROJECT_PATH##*/}`

cp $PROJECT_PATH/.env.develop $PROJECT_PATH/.env
docker compose exec app /bin/sh -c "cd ${PROJECT_DIR} && composer update"
docker compose exec app /bin/sh -c "cd ${PROJECT_DIR} && php artisan storage:link"
chmod 777 -R ${PROJECT_PATH}
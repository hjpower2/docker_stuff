build:
	docker build . -t nginx_img

start: build
	docker-compose up -d
#	./watcher.sh

clean:
	docker-compose down
	./dckr_cln.sh "nginx_img"

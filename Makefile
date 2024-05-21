build:
	docker build . -t nginx_img

start:
	docker-compose up -d

clean:
	docker-compose down
	./dckr_cln.sh "nginx_img"

```sudo make start``` begins the nginx server which is connected to the ```nginx-html``` directory and takes ```index.html``` and ```nginx.conf``` from that directory.
```sudo make clean``` will run ```docker-compose down``` and delete the built nginx image.

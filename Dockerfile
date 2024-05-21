FROM nginx

COPY ./nginx-html/index.html /usr/share/nginx/html/index.html
COPY ./nginx-html/nginx.conf /etc/nginx/nginx.conf

RUN apt update && apt upgrade -y

EXPOSE 707

CMD ["nginx", "-g", "daemon off;"]

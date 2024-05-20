FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

VOLUME /var/log/nginx

CMD ["nginx", "-g", "daemon off;"]

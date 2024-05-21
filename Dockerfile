FROM nginx

COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/nginx.conf



EXPOSE 707

CMD ["nginx", "-g", "daemon off;"]

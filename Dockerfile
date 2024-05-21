FROM nginx

COPY index.html /usr/share/nginx/html/

EXPOSE 800
EXPOSE 999

CMD ["nginx", "-g", "daemon off;"]

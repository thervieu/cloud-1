FROM nginx:latest

EXPOSE 80 443

COPY web_pages/*.html /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]

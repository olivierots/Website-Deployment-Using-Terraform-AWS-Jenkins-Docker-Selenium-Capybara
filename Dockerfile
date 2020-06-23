FROM nginx:alpine   
MAINTAINER Olivier Ots. <olivierots@hotmail.com>

COPY website /website
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80           


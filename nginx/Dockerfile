FROM alpine:3.14

RUN apk update && apk add nginx
RUN apk add openrc

RUN apk add systemd

# RUN adduser -D -g 'www' www \
# 	&& mkdir www \
# 	&& chown -R www:www /var/lib/nginx \
# 	&& chown -R www:www /www



# ADD /index.html /etc/nginx/html


COPY ./index.html /home/dev/www/index.html
# COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf


#copy ssl cert and key
# COPY ./nginx.crt /etc/ssl/certs/
# COPY ./nginx.key /etc/ssl/private/



EXPOSE 80


# comamnde docker

# docker build -t pj/nginx:1 .

# docker images

# docker built -it -d --rm --name nginx -p 430:80 pj/nginx:1

#commande nginx

# status nginx : sytemctl status nginx
# status nginx : sytemctl restart nginx
# relaad nginx : sytemctl reload nginx

# RUN systemctl status nginx



EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

# CMD ["rc-service", "nginx", "start;"]





ARG NGINX_VERSION=1.25.1
FROM nginx:${NGINX_VERSION}

ENV PHP_FPM_HOST=php-fpm

COPY conf/fastcgi_params /etc/nginx/fastcgi_params
COPY conf/nginx.conf /etc/nginx/nginx.conf.template

COPY docker-entrypoint.sh /

RUN rm /docker-entrypoint.d/* /etc/nginx/conf.d/*.conf && \
    chmod +x /docker-entrypoint.sh

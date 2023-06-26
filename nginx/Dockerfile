ARG NGINX_VERSION=1.25.1

FROM nginx:${NGINX_VERSION}

COPY conf/fastcgi_params /etc/nginx/fastcgi_params
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN rm /docker-entrypoint.d/* /etc/nginx/conf.d/*.conf && \
    mkdir -p /code/web

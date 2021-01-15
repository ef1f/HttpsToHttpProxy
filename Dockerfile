FROM nginx:alpine

## Copy our default nginx config
COPY nginx.conf.template /etc/nginx/


## Remove default nginx website and add envsubst, mc
RUN mkdir /certificate && rm -rf /usr/share/nginx/html/* && \
apk add gettext mc

EXPOSE 443

CMD envsubst </etc/nginx/nginx.conf.template> /etc/nginx/nginx.conf && \
exec nginx -g 'daemon off;'


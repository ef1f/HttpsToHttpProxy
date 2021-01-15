FROM nginx:alpine

## Copy our default nginx config
COPY default.conf.template /etc/nginx/conf.d/


## Remove default nginx website and add envsubst, mc
RUN mkdir /certificate && rm -rf /usr/share/nginx/html/* && \
apk add gettext mc


EXPOSE 443

CMD envsubst </etc/nginx/conf.d/default.conf.template> /etc/nginx/conf.d/default.conf && \
exec nginx -g 'daemon off;'


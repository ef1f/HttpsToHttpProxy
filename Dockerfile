FROM nginx:alpine

## Copy our default nginx config
COPY nginx.conf.template /etc/nginx/

ENV ENV_CRT_NAME=cert.crt
ENV ENV_KEY_NAME=cert.key

## Remove default nginx website and add envsubst, mc
RUN mkdir /certificate && rm -rf /usr/share/nginx/html/* && rm -rf /etc/nginx/conf.d/* && \
apk add gettext mc

EXPOSE 443

CMD envsubst '$$ENV_PASS_HOST $$ENV_CRT_NAME $$ENV_KEY_NAME' </etc/nginx/nginx.conf.template> /etc/nginx/nginx.conf && \
exec nginx -g 'daemon off;'



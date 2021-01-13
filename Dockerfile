FROM nginx:alpine

## Copy our default nginx config
COPY nginx/default.conf.template /etc/nginx/conf.d/

## Copy certificate
#COPY certificate/amr.crt /etc/nginx
#COPY certificate/amr.key /etc/nginx

## Remove default nginx website and add envsubst, mc
RUN mkdir /certificate && rm -rf /usr/share/nginx/html/* && \
apk add gettext mc

# CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443

CMD envsubst '\$ENV_WEB_HOST' </etc/nginx/conf.d/default.conf.template> /etc/nginx/conf.d/default.conf && \
exec nginx -g 'daemon off;'


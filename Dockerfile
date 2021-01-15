FROM nginx:latest

## Copy our default nginx config
COPY default.conf.template /etc/nginx/conf.d/

## Copy certificate
#COPY certificate/amr.crt /etc/nginx
#COPY certificate/amr.key /etc/nginx

## Remove default nginx website and add envsubst, mc
RUN mkdir /certificate && rm -rf /usr/share/nginx/html/* && \
apt-get update -y && \
apt-get install -y --no-install-recommends gettext mc
#apk add gettext mc

# CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443

CMD envsubst </etc/nginx/conf.d/default.conf.template> /etc/nginx/conf.d/default.conf && \
exec nginx -g 'daemon off;'


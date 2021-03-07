# Https to http nginx reverse proxy

**Build image**
```
docker build -t image_name:latest .
```

**Run**
```
docker run -d 
           -e ENV_PASS_HOST=<server_host>:<port> 
           -e ENV_CRT_NAME=<.crt file name>
           -e ENV_KEY_NAME<.key file name>
           -v <your certificates folder path>:/certificate 
           -p <proxy port>:443 --name reverse_proxy ef1f/https-to-http-proxy:latest
```

**Compose file example**
```
version: '2'

services:
  <you service>:
    image: <service image>
    ports:
      - "8081:8080"
 
     
  https-to-http-proxy:
    image: ef1f/https-to-http-proxy:latest
    ports:
      - "8088:443"
    volumes:
      - /<your certificates folder path>:/certificate     
    environment:
      - ENV_PASS_HOST=<you service>:8080
      - ENV_CRT_NAME=<.crt file name>
      - ENV_KEY_NAME=<.key file name>
    depends_on:
      - <you service>
```

The folder with certificates must contain two files .crt and .key

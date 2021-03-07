# Https to http nginx reverse proxy

**Build image**
```
docker build -t image_name:latest .
```

**Run**
```
docker run -d -e ENV_PASS_HOST=you_service:port -e ENV_CRT_NAME=you_file_name.crt -e ENV_KEY_NAME=you_file_name.key -v your_certificates_folder_path:/certificate -p proxy_port:443 --name reverse_proxy ef1f/https-to-http-proxy:latest
```

**Compose file example**
```
version: '2'

services:
  you_service:
    image: service_image
    ports:
      - "8081:8080"
 
     
  https-to-http-proxy:
    image: ef1f/https-to-http-proxy:latest
    ports:
      - "8088:443"
    volumes:
      - /your_certificates_folder_path:/certificate     
    environment:
      - ENV_PASS_HOST=you_service:8081
      - ENV_CRT_NAME=you_file_name.crt 
      - ENV_KEY_NAME=you_file_name.key 
    depends_on:
      - you_service
```

The folder with certificates must contain two files .crt and .key

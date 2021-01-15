# Https to http nginx reverse proxy

**Build image**
```
docker build -t image_name:latest .
```

**Run**
```
docker run -d -e ENV_PASS_HOST=<server_host>:<port> -v <your certificates folder path>:/certificate -p <proxy port>:443 --name reverse_proxy ef1f/https-to-http-proxy:latest
```

The folder with certificates must contain two files crt and key

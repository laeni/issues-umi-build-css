# 本脚步用于开发阶段使用docker快速部署nginx中

# 生成 Nginx 配置文件
newNgConf(){
  cat > ./nginx.local.conf <<EOF
user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;
    client_max_body_size 2048m;

    log_format  main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                      '\$status \$body_bytes_sent "\$http_referer" '
                      '"\$http_user_agent" "\$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    gzip  on;
    gzip_min_length 1k;
    gzip_buffers 4 16k;
    gzip_comp_level 2;
    gzip_types application/javascript text/plain application/x-javascript text/css application/xml text/javascript application/x-httpd-php image/jpeg image/gif image/png;
    gzip_vary off;
    gzip_disable "MSIE [1-6]\.";

    server {
        listen       80;
        listen  [::]:80;
        server_name  localhost;

        location / {
            root   /usr/share/nginx/html/dist;
            try_files \$uri \$uri/index.html /wait/index.html /index.html =200;
        }

        location = /50x.html {
            root   /usr/share/nginx/html;
        }
    }
}

EOF
}
newNgConf

docker stop nginx
docker rm nginx

HOME=$(pwd)
docker run -d \
  --restart=always \
  --name nginx \
  -p 81:80 \
  -v "$HOME/nginx.local.conf:/etc/nginx/nginx.conf" \
  -v "$HOME:/usr/share/nginx/html" \
  -v /etc/localtime:/etc/localtime \
  nginx:1.21.1-alpine


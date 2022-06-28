# 本脚步用于开发阶段使用docker快速部署nginx中

# 生成 Nginx 配置文件
newNgConf(){
  cat > ./nginx.local.conf <<EOF
user  nginx;
worker_processes  auto;

pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    sendfile        on;

    server {
        listen       80;
        listen  [::]:80;
        server_name  localhost;

        location / {
            root   /usr/share/nginx/html/dist;
        }
    }
}

EOF
}
newNgConf

docker stop nginx
docker rm nginx

HOME=$(pwd)
docker run --rm -it \
  --restart=always \
  -p 81:80 \
  -v "$HOME/nginx.local.conf:/etc/nginx/nginx.conf" \
  -v "$HOME:/usr/share/nginx/html" \
  -v /etc/localtime:/etc/localtime \
  nginx:1.21.1-alpine


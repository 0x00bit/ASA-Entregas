mkdir /etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout example.key -out example.crt \
  -subj "/CN=localhost"
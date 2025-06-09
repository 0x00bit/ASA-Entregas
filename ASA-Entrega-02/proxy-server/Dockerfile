FROM nginx:latest

# Instalar o openssl
RUN apt-get update && \
    apt-get install -y openssl && \
    rm -rf /var/lib/apt/lists/*

# Criar diretório para os certificados SSL
RUN mkdir -p /etc/ssl/certs

# Copiar o script de geração de certificados
COPY generate_ssl.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/generate_ssl.sh

# Executar o script para gerar os certificados durante o build
RUN /usr/local/bin/generate_ssl.sh

# Copia a configuracao do servidor
COPY default.conf /etc/nginx/conf.d

# Copia a pagina personalizada para a imagem do servidor
COPY index.html /usr/share/nginx/html

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
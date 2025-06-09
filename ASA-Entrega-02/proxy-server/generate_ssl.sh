#!/bin/bash

# Script para gerar chave privada e certificado autoassinado SSL

# Configurações
SSL_DIR="/etc/ssl/certs"
KEY_NAME="server.key"
CERT_NAME="server.crt"
DAYS_VALID=365
SUBJECT="/C=BR/ST=Sao_Paulo/L=Sao_Paulo/O=MyCompany/CN=localhost"

# Criar diretório se não existir
mkdir -p "$SSL_DIR"

# Gerar chave privada
echo "Gerando chave privada RSA de 2048 bits..."
openssl genrsa -out "$SSL_DIR/$KEY_NAME" 2048

# Gerar certificado autoassinado
echo "Gerando certificado autoassinado válido por $DAYS_VALID dias..."
openssl req -new -x509 -key "$SSL_DIR/$KEY_NAME" -out "$SSL_DIR/$CERT_NAME" -days "$DAYS_VALID" -subj "$SUBJECT"

# Ajustar permissões
chmod 600 "$SSL_DIR/$KEY_NAME"
chmod 644 "$SSL_DIR/$CERT_NAME"

echo "SSL files generated successfully:"
echo " - Private key: $SSL_DIR/$KEY_NAME"
echo " - Certificate: $SSL_DIR/$CERT_NAME"
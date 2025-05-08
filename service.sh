#!/bin/bash

# Variaveis
'''Uso esperado do programa: ./service.sh <servico> <acao>'''
servico=$1
acao=$2

# Executando o compose
case "$servico-$acao" in
    dns-start) docker-compose up -d dns ;;
    dns-stop) docker-compose stop dns ;;
    dns-start) docker-compose up -d web ;;
    dns-start) docker-compose stop web ;;
    # Execao por uso indevido
    *)
        echo "Comando invalido; Uso: $0 <dns|web> <start|stop>."
        exit 1
        ;;
esac

echo "Servico $servico $acao executado."

# Atividade ASA 01 - Docker (Web + DNS)

## Estrutura de Arquivos

```plaintext
atividade-asa-01/
│
├── dns/
│   ├── Dockerfile          # Container DNS (Bind9)
│   ├── db.asa.br           # Zona DNS (registros para asa.br)
│   └── named.conf.local    # Configuração local do Bind9
│
├── web/
│   ├── Dockerfile          # Container Web (Nginx)
│   └── index.html          # Página HTML estática
│
├── docker-compose.yml      # Orquestração dos serviços
├── service.sh             # Script de controle (start/stop)
└── README.md              # Documentação
```

## Como Usar
```bash
# 1. Dê permissão ao script:
chmod +x service.sh

# 2. Inicie os serviços:
./service.sh dns start
./service.sh web start

# 3. Teste o DNS:
dig @localhost www.asa.br

# 4. Acesse o site:
curl http://localhost
```

## Configuração do DNS Local
- Para usar www.asa.br no navegador:
```bash
# Linux/macOS:
echo "nameserver 127.0.0.1" | sudo tee /etc/resolv.conf

# Windows (PowerShell como Admin):
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 127.0.0.1
```
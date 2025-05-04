# ASA-Entregas
Repositório voltado a todas as atividades e exercícios realizados durante a disciplina de ASA pelo professor Francisco Sales

# Atividade 1 
## Interação entre três containers diferentes

### Descrição
Para esta atividade, foi proposto a criação e o deploy de três containers de forma que eles se comuniquem entre si em uma
mesma rede. Para demonstrar de forma didática, optei por usar duas ferramentas do *Docker*: **Compose** e o **Build**.

### Estrutura do projeto:
- **app.py**: Se trata de um servidor web o qual utiliza o *framework* Flask do Python para funcionar. Ao iniciar, tenta realizar uma conexão com uma base de dados, se a conexão acontecer, este server retorna uma página web com os dizeres: *Successfully connected to the database!"*

- **compose.yml**: É o arquivo necessário para que o **docker compose** dê o deploy de multiplos containers. Ao iniciar, é feito o deploy das seguintes imagens: postgres (para a base de dados), o server web que utiliza a ferramenta **build** para criar o container da aplicação python, baixando todas as dependências necessárias e por fim, um container que contém a imagem do CURL, um utilitário de várias distribuições linux para a realização de requisições.

- **dockerfile**: São as instruções necessárias para o deploy do container o qual contém a imagem do servidor web feito em python. Ao ser executado pela ferramenta de build, é utilizada uma imagem python, criada uma área de trabalho dentro do container, copiado o arquivo "app.py" para dentro dessa área de trabalho e executado a aplicação.

#### Demonstração
- 1. Dê o deploy dos containers: `docker compose up -d`. Este comando iniciará a ferramenta de compose que automáticamente procura por arquivos "compose.yml". O argumento "-d" sinaliza para a aplicação que queremos que o container rode em segundo plano

- 2. Cheque se os containers estão realmente sendo executados com `docker compose ps`

- 3. Entre dentro do container cliente `docker exec -it asa-entregas-client-1 sh`. Este comando está dizendo que queremos interagir como o container `asa-entregas-client-1` e que queremos executar o binário `sh`

- 4. Por fim, teste a conectividade com: `curl http://web:5000`
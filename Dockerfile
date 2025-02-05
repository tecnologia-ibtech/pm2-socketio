FROM node:16.16.0

MAINTAINER Bruno Thiago Pereira "bruno@ibtech.inf.br"

# Criando diretório da aplicação com permissões corretas
RUN mkdir -p /app && chown -R node:node /app
WORKDIR /app

# Instalando a versão correta do PM2
RUN npm remove -g pm2 && npm install -g @socket.io/pm2

# Adicionando o script de inicialização
COPY start /start
RUN chmod +x /start

# Expondo a porta
EXPOSE 5225

# Iniciando com PM2
CMD ["pm2-runtime", "start", "/start"]

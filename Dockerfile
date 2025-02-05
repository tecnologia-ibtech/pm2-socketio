FROM node:16.16.0

MAINTAINER Bruno Thiago Pereira "bruno@ibtech.inf.br"

# Criar diretório da aplicação com permissões corretas
RUN mkdir -p /app && chown -R node:node /app
WORKDIR /app

# Instalar o PM2 adequado para Socket.IO
RUN npm remove -g pm2 && npm install -g @socket.io/pm2

# Definir fuso horário corretamente dentro do container
ENV TZ=America/Recife
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Adicionar script de inicialização
COPY start /start
RUN chmod +x /start

# Expor a porta padrão
EXPOSE 5225

# Definir entrada para PM2 considerando as variáveis de ambiente APP e WATCH
CMD ["pm2-runtime", "start", "--name", "socketio-app", "$APP", "--watch=$WATCH"]

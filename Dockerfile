FROM node:16.16.0

MAINTAINER Bruno Thiago Pereira "bruno@ibtech.inf.br"


RUN npm remove -g pm2

RUN npm install -g @socket.io/pm2

VOLUME ["/app"]
ADD start /start
RUN chmod 755 /start
CMD ["/start"]

EXPOSE 5225

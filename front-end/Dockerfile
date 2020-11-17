FROM node:8.11.2

RUN npm install npm@latest -g && \
    npm install -g http-server

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]

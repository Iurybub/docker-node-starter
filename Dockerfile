FROM node:14-alpine as base

ENV NODE_ENV=production

RUN mkdir /app && chown -R node:node /app

WORKDIR /app

COPY package.json package-lock*.json ./

USER node

RUN npm install && npm cache clean --force

COPY . .

CMD ["node", "./bin/www"]
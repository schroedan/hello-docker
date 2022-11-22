# syntax=docker/dockerfile:1

FROM node:18-alpine as node

FROM node as dev

RUN apk add --no-cache git

FROM node

WORKDIR /app

COPY --link . .

RUN npm ci --prod

CMD ["node", "src/index.js"]

EXPOSE 3000

# syntax=docker/dockerfile:1

FROM node:18-alpine

WORKDIR /app

COPY --link . .

RUN npm ci --prod

CMD ["node", "src/index.js"]

EXPOSE 3000

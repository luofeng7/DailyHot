FROM node:lts-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM busybox:1.35.0-uclibc

WORKDIR /app

COPY --from=0 /app/dist .

COPY --from=0 /app/start.sh .

ENV API="https://api-hot.imsyy.top"

ENV ICP="豫ICP备2022018134号-1"

CMD ["/app/start.sh"]

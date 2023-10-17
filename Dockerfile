FROM node:lts-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM busybox:1.35.0-uclibc

WORKDIR /app

COPY --from=0 /app/dist .

ENV VITE_GLOBAL_API="https://api-hot.imsyy.top"

ENV VITE_ICP="豫ICP备2022018134号-1"

CMD ["httpd", "-f", "-p", "80", "-h", "/app"]

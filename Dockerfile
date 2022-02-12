FROM node:14.1.0-alpine as node

WORKDIR /usr/src/ap

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Stage 2
FROM nginx:1.13.12-alpine

COPY --from=node /usr/src/ap/dist/angular-chat /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

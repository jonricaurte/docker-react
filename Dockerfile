FROM node:alpine as builder
WORKDIR /var/www
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /var/www/build /usr/share/nginx/html

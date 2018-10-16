FROM node:alpine as builder
WORKDIR /var/www
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /var/www/build /usr/share/nginx/html

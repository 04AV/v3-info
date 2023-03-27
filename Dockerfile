FROM node:16.13.0 as build

WORKDIR /

COPY package.json ./
COPY yarn.lock ./

RUN yarn

COPY . .

RUN yarn build


FROM nginx:1.23.0

COPY ./nginx.conf /etc/nginx.conf
COPY --from=build /app/build /usr/share/nginx/html






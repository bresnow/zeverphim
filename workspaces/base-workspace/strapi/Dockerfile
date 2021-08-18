FROM node:lts-slim
ARG STRAPI_URL
ARG ADMIN_JWT_SECRET



WORKDIR /app
COPY ./strapi/package.json ./
COPY ./strapi/yarn.lock ./

RUN yarn

COPY ./strapi/ .

ENV STRAPI_URL=$STRAPI_URL
ENV ADMIN_JWT_SECRET=$ADMIN_JWT_SECRET
ENV NODE_ENV=production

RUN yarn run build --clean

EXPOSE 1337

CMD ["yarn", "run", "start"]

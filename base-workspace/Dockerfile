ARG docker_registry=docker.io/alnoda
ARG image_tag=18.04-0.7
ARG REPOSITORY_BASE=sudobmitch
ARG DATABASE_HOST
ARG DATABASE_PORT
ARG DATABASE_USERNAME

FROM ${REPOSITORY_BASE}/base:scratch as base-scratch
FROM ${docker_registry}/ubuntu-workspace:${image_tag}

USER root

################################################################# TOOLS: cronicle, strapi


COPY Cronicle-0.8.61 /opt/cronicle
COPY strapi /opt/strapi 

RUN echo "------------------------------------------------------ cronicle" \
	&& mkdir -p /opt/cronicle \
	&& cd /opt/cronicle && nodeenv --node=12.18.3 --npm=6.0.0 env \
	&& cd /opt/cronicle && . env/bin/activate && npm install; node bin/build.js dist

COPY cronicle-config.json /opt/cronicle/conf/config.json
COPY supervisord-workspace-base.conf /etc/supervisord/

RUN echo "------------------------------------------------------ user" \
	&& mkdir -p /var/log/cronicle


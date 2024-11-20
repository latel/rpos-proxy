FROM node:12.22.4-alpine3.12
WORKDIR /app
RUN apk update
RUN apk add git
RUN apk add python3 ffmpeg
ADD rpos-master.tar /app/
WORKDIR /app/rpos-master/
RUN npm i
RUN npx gulp
RUN cp rposConfig.sample-proxy.json rposConfig.json
EXPOSE 18081
RUN ls
ENTRYPOINT ['node', 'rpos.js']
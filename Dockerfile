FROM node:6.9.5-alpine

RUN mkdir -p /code
WORKDIR /code
ADD . /code

#ENV NODE_ENV production
#RUN npm install --production

RUN npm set progress=false && \
    npm install -s --no-progress

CMD ["npm","start"]

EXPOSE 5000

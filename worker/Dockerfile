FROM node:alpine

WORKDIR '/app'
RUN npm install -g yarn
COPY ./package.json ./
RUN yarn install
COPY . .
CMD ["yarn", "start"]

FROM node:lts-alpine
ENV NODE_ENV=production
ENV PORT=3000
ENV MODEL_URL='https://storage.googleapis.com/submissionmlgc-fakhrifitra/model.json'
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]

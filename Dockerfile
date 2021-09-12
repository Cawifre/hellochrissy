FROM cawifre/docker-vue-cli:latest AS builder

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm ci --only=production

# Bundle app source
COPY . .

RUN npm build

FROM nginx:alpine AS runner

COPY --from=builder /usr/src/app/dist /usr/share/nginx/html

EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
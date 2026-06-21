FROM node:10.24.1-buster-slim AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build -- --prod

FROM nginx:1.25-alpine

COPY --from=builder /app/dist/frontend/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

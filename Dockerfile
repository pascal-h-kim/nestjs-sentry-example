FROM node:16.18.0 AS builder
COPY . ./app
WORKDIR /app
RUN npm install && npm run build

FROM node:16.18.0
WORKDIR /app
COPY --from=builder /app ./
CMD ["npm", "run", "start:debug"]

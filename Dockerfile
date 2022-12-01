FROM node:16.18.0 AS builder
COPY . ./app
WORKDIR /app
RUN npm install && npm run build

FROM node:16.18.0
WORKDIR /app
COPY --from=builder /app ./
ENV SENTRY_DSN https://f3250072032044a6ae642c5f9a72d047@o4504208246833152.ingest.sentry.io/4504246698770432
CMD ["npm", "run", "start:debug"]

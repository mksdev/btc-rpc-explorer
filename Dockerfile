FROM node:14 as builder
WORKDIR /workspace
COPY . .
RUN npm install

FROM node:14-alpine
RUN apk add --no-cache tzdata
ENV TZ=Europe/Prague
WORKDIR /workspace
COPY --from=builder /workspace .
RUN apk --update add git
CMD npm start
EXPOSE 3002

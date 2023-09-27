# syntax=docker/dockerfile:experimental
FROM maven:3.6.0-jdk-8-alpine

WORKDIR /app

ADD . .
#RUN --mount=type=cache,target=/root/.m2 mvn -U -B -e clean package -Dmaven.test.skip=true
RUN mvn -U -B -e clean package -Dmaven.test.skip=true

FROM harbor.gwmdevops.com/devops/openjdk:8-jre-alpine

COPY --from=0 /app/target/*-app.jar /app.jar
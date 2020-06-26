FROM openjdk:8-jdk-alpine AS build
WORKDIR /app
COPY gradlew .
COPY gradle gradle
COPY build.gradle settings.gradle ./
COPY ./library /app/library
COPY ./book-application /app/book-application
COPY ./hello-application /app/hello-application

RUN ./gradlew :book-application:build

FROM openjdk:8-jre-alpine as production

COPY --from=build /app/book-application/build/libs/*.jar /app/book-application.jar

ENTRYPOINT ["java", "-jar","/app/book-application.jar"]

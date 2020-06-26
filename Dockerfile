FROM openjdk:8-jdk-alpine AS build
WORKDIR /app
COPY gradlew .
COPY gradle gradle
COPY build.gradle settings.gradle ./
COPY ./library /app/library
COPY ./book-application /app/book-application
COPY ./hello-application /app/hello-application

RUN ./gradlew :book-application:build
RUN mkdir -p build/dependency && (cd build/dependency; jar xf ../../book-application/build/libs/*.jar)
ENTRYPOINT ["java", "-cp", "app:app/build/dependency/BOOT-INF/lib/*","nanihutagaol.simpleapp.BookApplication"]

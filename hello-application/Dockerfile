FROM openjdk:8-jdk-alpine AS build
WORKDIR /app
COPY gradlew .
COPY gradle gradle
RUN ./gradlew wrapper
COPY build.gradle settings.gradle ./
COPY ./hello-application /app/hello-application

RUN ./gradlew :hello-application:build
RUN mkdir -p build/dependency && (cd build/dependency; java -Djarmode=layertools -jar ../../hello-application/build/libs/*.jar extract)

FROM openjdk:8-jre-alpine as production
ARG DEPENDENCY=/app/build/dependency

COPY --from=build ${DEPENDENCY}/dependencies/ ./
COPY --from=build ${DEPENDENCY}/snapshot-dependencies/ ./
COPY --from=build ${DEPENDENCY}/spring-boot-loader/ ./
COPY --from=build ${DEPENDENCY}/application/ ./

ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]

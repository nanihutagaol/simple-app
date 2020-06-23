FROM openjdk:8-jdk-alpine as build
WORKDIR /app
COPY gradlew .
COPY gradle gradle
COPY build.gradle settings.gradle ./
COPY ./library /app/library
COPY ./book-application /app/book-application
COPY ./hello-application /app/hello-application

RUN ./gradlew clean :book-application:build
RUN mkdir -p build/dependency && (cd build/dependency; jar xf ../../book-application/build/libs/*.jar)

FROM openjdk:8-jre-alpine as production
ARG DEPENDENCY=/app/build/dependency

COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java", "-cp", "app:app/lib/*","nanihutagaol.simpleapp.BookApplication"]


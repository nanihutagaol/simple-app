FROM openjdk:8-jdk-alpine as build
WORKDIR /app
COPY gradlew .
COPY .gradle .gradle
COPY ./controller /app/controller
COPY ./exception /app/exception
COPY ./main-app /app/main-app
COPY ./repository /app/repository
COPY ./service /app/service
RUN ./gradlew build
RUN mkdir -p /build/libs
RUN mkdir -p build/dependency && (cd build/dependency; jar -xf ../../main-app/build/libs/*.jar)

FROM openjdk:8-jre-alpine as production
ARG DEPENDENCY=/app/build/dependency

COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java", "-cp", "app:app/lib/*","nanihutagaol.simpleapp.SimpleAppApplication"]


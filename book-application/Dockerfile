FROM openjdk:8-jdk-alpine AS build
WORKDIR /app
COPY gradlew .
COPY gradle gradle
RUN ./gradlew wrapper
COPY build.gradle settings.gradle ./
COPY ./library /app/library
COPY ./book-application /app/book-application
RUN ./gradlew :book-application:build
RUN java -Djarmode=layertools -jar book-application/build/libs/*.jar extract

FROM openjdk:8-jre-alpine as production
COPY --from=build /app/dependencies/ ./
COPY --from=build /app/snapshot-dependencies/ ./
COPY --from=build /app/company-dependencies/ ./
COPY --from=build /app/spring-boot-loader/ ./
COPY --from=build /app/application/ ./
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]

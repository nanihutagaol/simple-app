# simple-app
### simple-app with spring-boot + gradle + docker

This is multi project build, contained 3 module:
- library
- book application
- hello application

We can build apps using 2 ways:
- using Dockerfile + docker-compose:

      docker-compose up

- using buildpack:

      ./gradlew module-name:bootBuildImage


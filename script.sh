./gradlew simple-app/book-application:bootBuildImage --imageName=rainx14/simple-app:clone-https
docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
docker push rainx14/simple-app:clone-https
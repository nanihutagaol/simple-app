rm -R simple-app
git clone -b buildpack-with-layered-jar https://github.com/nanihutagaol/simple-app.git
cd simple-app
docker pull rainx14/book-app:latest
./gradlew book-application:bootBuildImage --imageName=rainx14/book-app:0.0.1
docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
docker push rainx14/book-app:latest
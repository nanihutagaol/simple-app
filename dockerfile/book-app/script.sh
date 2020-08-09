rm -R simple-app
git clone -b buildpack-with-layered-jar https://github.com/nanihutagaol/simple-app.git
docker pull rainx14/book-app2:latest
docker build -t rainx14/book-app2:latest -f build/book-app/Dockerfile /app/simple-app
docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
docker push rainx14/book-app2:latest
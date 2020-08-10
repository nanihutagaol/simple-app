git clone -b book-dockerfile-layered https://github.com/nanihutagaol/simple-app.git
cd simple-app

docker pull rainx14/book-app:builder || true
docker pull rainx14/book-app:production || true

docker build --target build \
      -t rainx14/book-app:builder \
      -f Dockerfile.book \
      --cache-from=rainx14/book-app:builder .

docker build --target production \
      -t rainx14/book-app:production \
      -f Dockerfile.book \
      --cache-from=rainx14/book-app:builder \
      --cache-from=rainx14/book-app:production .

docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
docker push rainx14/book-app:builder
docker push rainx14/book-app:production
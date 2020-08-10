FROM openjdk:custom
WORKDIR /app
COPY book-script.sh /app/book-script.sh
RUN chmod +rx /app/book-script.sh
ENTRYPOINT ["/bin/sh", "/app/book-script.sh"]
FROM openjdk:8-jre-alpine
MAINTAINER Justin Menga <justin.menga@gmail.com>
LABEL application=microtrader

# Install system dependencies
RUN apk add --update --no-cache bash curl

# Create vertx user
RUN mkdir /app && \
    addgroup -g 1000 vertx && \
    adduser -u 1000 -G vertx -D vertx && \
    chown -R vertx:vertx /app

# Set default user
USER vertx
WORKDIR /app

# Set entrypoint and default command arguments
COPY cluster.xml /app/conf/cluster.xml
COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["java", "-jar", "/app/app.jar", "-server", "-cluster", "-Dvertx.hazelcast.config=/app/conf/cluster.xml"]
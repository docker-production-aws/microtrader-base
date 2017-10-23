FROM openjdk:8-jre-alpine
MAINTAINER Justin Menga <justin.menga@gmail.com>
LABEL application=microtrader

# Install system dependencies
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk add --update --no-cache bash curl confd@testing py2-pip && \
    pip install awscli

# Create vertx user
RUN mkdir -p /app/conf && \
    addgroup -g 1000 vertx && \
    adduser -u 1000 -G vertx -D vertx && \
    chown -R vertx:vertx /app

# Set default user
USER vertx
WORKDIR /app

# Copy common confd templates
COPY etc/confd /etc/confd

# Set entrypoint and default command arguments
COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["java", "-jar", "/app/app.jar", "-server", "-cluster", "-Dvertx.hazelcast.config=/app/conf/cluster.xml"]
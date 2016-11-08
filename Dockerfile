FROM openjdk:8-jre-alpine
MAINTAINER Justin Menga <justin.menga@gmail.com>
LABEL application=microtrader

# Install system dependencies
RUN apk add --update --no-cache bash curl 

# Set entrypoint and default command arguments
COPY cluster.xml /app/conf/cluster.xml
COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["java", "-jar", "/app/app.jar", "-server", "-cluster", "-Dvertx.hazelcast.config=/app/conf/cluster.xml"]
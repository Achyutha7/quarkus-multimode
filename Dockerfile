FROM openjdk:11-slim

ARG APP_NAME=quarkus-multimodule
ARG APP_VERSION=undefined

ENV JAR_NAME="$APP_NAME-$APP_VERSION-runner.jar"
ENV JAVA_OPTIONS="-Dquarkus.http.host=0.0.0.0 -Djava.util.logging.manager=org.jboss.logmanager.LogManager"
#COPY --chown=1001 target/$JAR_NAME /deployments/
COPY --chown=185 target/quarkus-app/lib /deployments/lib/
COPY --chown=185 target/quarkus-app/*.jar /deployments/
COPY --chown=185 target/quarkus-app/app /deployments/app/
COPY --chown=185 target/quarkus-app/quarkus /deployments/quarkus/

EXPOSE 8080
USER 1001

#ENTRYPOINT java -jar /deployments/$JAR_NAME
ENTRYPOINT [ "java", "- jar", "/deployments/quarkus-run.jar" ]
FROM openjdk:8-jre-alpine

RUN mkdir /rundeck && \
    chmod 777 /rundeck

COPY rundeck-launcher-2.10.0.jar /rundeck/

EXPOSE 8080
EXPOSE 8443

USER 1001

CMD java -XX:MaxPermSize=512m -Xms2048m -Xmx4096m \
     -Dserver.http.port=8080 \
     -Dserver.https.port=8443 \
     -jar /rundeck/rundeck-launcher-2.10.0.jar
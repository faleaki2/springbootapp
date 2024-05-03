FROM openjdk:17
RUN mkdir /datadog
COPY dd-java-agent.jar /datadog

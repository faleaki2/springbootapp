FROM openjdk:17
USER root
COPY upload/src /tmp/src
RUN chown -R 185:0 /tmp/src
USER 185
RUN mkdir /datadog
COPY dd-java-agent.jar /datadog
RUN /usr/local/s2i/assemble

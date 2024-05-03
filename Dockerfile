FROM image-registry.openshift-image-registry.svc:5000/openshift/java@sha256:46a4e73ddb085d1f36b39903ea13ba307bb958789707e9afde048764b3e3cae2
USER root
COPY upload/src /tmp/src
RUN chown -R 185:0 /tmp/src
USER 185
RUN mkdir /datadog
COPY dd-java-agent.jar /datadog
RUN /usr/local/s2i/assemble

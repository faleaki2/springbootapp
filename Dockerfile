FROM openjdk:17
RUN curl -Lo dd-java-agent.jar 'https://dtdg.co/latest-java-tracer'
COPY dd-java-agent.jar /deployment
ENTRYPOINT ["java" , "-javaagent:/deployment/dd-java-agent.jar", "-jar" , "/deployment/hello-SNAPSHOT.jar"]

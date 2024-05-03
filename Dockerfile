FROM openjdk:17
ADD target/hello-0.0.1-SNAPSHOT.jar hello-0.0.1-SNAPSHOT.jar
RUN curl -Lo dd-java-agent.jar 'https://dtdg.co/latest-java-tracer'
ENTRYPOINT ["java" , "-javaagent:../dd-java-agent.jar", "-jar" , "target/hello-SNAPSHOT.jar"]
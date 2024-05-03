FROM openjdk:8
COPY dd-java-agent.jar /deployments
ENTRYPOINT ["java" , "-javaagent:/deployment/dd-java-agent.jar", "-jar" , "/deployments/hello-0.0.1-SNAPSHOT.jar"]

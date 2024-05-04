FROM maven:3.6.3-jdk-8 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:8
RUN mkdir /deployments
COPY --from=build /home/app/target/hello-0.0.1-SNAPSHOT.jar /deployments
COPY dd-java-agent.jar /deployments
EXPOSE 8080
ENTRYPOINT ["java" , "-javaagent:/deployment/dd-java-agent.jar", "-jar" , "/deployments/hello-0.0.1-SNAPSHOT.jar"]

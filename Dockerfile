FROM maven:3.8.5-jdk-8 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:17
RUN mkdir /deployments
COPY --from=build /home/app/target/hello-0.0.1-SNAPSHOT.jar /deployments/hello-0.0.1-SNAPSHOT.jar
COPY dd-java-agent.jar /deployments
EXPOSE 8081
ENTRYPOINT ["java" , "-javaagent:/deployment/dd-java-agent.jar", "-jar" , "/deployments/hello-0.0.1-SNAPSHOT.jar"]

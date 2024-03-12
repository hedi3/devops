FROM openjdk:11
WORKDIR /app
COPY target/eventsProject-1.0.0-SNAPSHOT.jar /app/eventsProject.jar
EXPOSE 8089
ENTRYPOINT ["java", "-jar", "eventsProject.jar"]

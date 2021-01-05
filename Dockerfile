FROM openjdk:8
ADD ./friday-app-0.0.1-SNAPSHOT.jar friday-app-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "friday-app-0.0.1-SNAPSHOT.jar"]


FROM openjdk:8
ADD ./helloworld.jar helloworld.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "helloworld.jar"]


FROM maven:latest
ADD target/dockerImg.jar dockerImg.jar
ENTRYPOINT ["java","-jar","/dockerImg.jar"]
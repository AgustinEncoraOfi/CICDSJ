FROM maven:latest
ADD target/springboot-deploy.jar springboot-deploy.jar
ENTRYPOINT ["java","-jar","/springboot-deploy.jar"]
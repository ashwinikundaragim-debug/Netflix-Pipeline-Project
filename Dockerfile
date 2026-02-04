FROM openjdk:17.0.2-jdk-slim

WORKDIR /app

COPY target/netflix-app-1.0.0.jar /app/netflix-app.jar

EXPOSE 8080 

ENTRYPOINT ['java,'-jar','netfilx.jar'] 

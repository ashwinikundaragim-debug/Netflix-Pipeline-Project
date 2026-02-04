#Build  stage  - generate the war file
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DSkipTests

#Runtime stage
FROM tomcat:9.0-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/target/NETFLIX-1.2.2.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080 
CMD ['catalina.sh','run'] 

FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
COPY day9-app-1.0.0.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
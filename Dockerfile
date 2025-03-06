# First stage: Build the Spring Boot application
FROM gradle:8-jdk17 AS builder

# Set work directory inside the container
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/dclinkenbeard/cst438_SpringDockerDemo.git

# Move into the project directory
WORKDIR /app/cst438_SpringDockerDemo

# Set execute permissions for Gradle wrapper
RUN chmod +x gradlew

# Run Gradle build (use wrapper instead of system Gradle)
RUN ./gradlew build -x test

# Second stage: Run the Spring Boot application in a lightweight JDK container
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the built JAR from the builder stage
COPY --from=builder /app/cst438_SpringDockerDemo/build/libs/*.jar app.jar

# Expose the application port (8080 is default for Spring Boot)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
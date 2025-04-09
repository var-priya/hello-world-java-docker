# Use openjdk image with JDK 17
FROM openjdk:17-slim

# Install Maven
RUN apt-get update && apt-get install -y maven

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml to leverage Docker cache for dependencies
COPY pom.xml .

# Copy the source code into the container
COPY src /app/src

# Build the application using Maven (assuming pom.xml is a Maven project)
RUN mvn clean package -DskipTests

# Expose the port your application will run on (adjust this port as needed)
EXPOSE 8080

# Run the application using the JAR file (replace 'target/app.jar' with the actual path to the JAR)
CMD ["java", "-jar", "target/hello-world-docker-1.0-SNAPSHOT.jar"]

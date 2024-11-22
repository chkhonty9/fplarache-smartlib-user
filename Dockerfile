# FROM openjdk:17-oracle
# VOLUME /tmp
# COPY target/*.jar app.jar
# ENTRYPOINT ["java","-jar", "app.jar"]

FROM openjdk:17-oracle

WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application (this will generate the JAR file in the target/ directory)
RUN mvn clean package -DskipTests

# Copy the JAR file
COPY target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
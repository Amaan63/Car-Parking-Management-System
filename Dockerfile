
# Use Maven with JDK 21 as the base image to build the project
FROM maven:3.9.6-eclipse-temurin-21 AS build

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Build the WAR file
RUN mvn clean package

# Use Tomcat 9 as the runtime image (even though it's not officially compatible with JDK 21)
FROM tomcat:9.0

# Set compatibility flags to try and force JDK 21 to work with Tomcat 9
ENV CATALINA_OPTS="--add-opens=java.base/java.lang=ALL-UNNAMED"

# Copy the generated WAR file to Tomcat's webapps directory
COPY --from=build /app/target/CarParkingManagementSystem.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]


# Use Maven as the base image to build the project
FROM maven:3.8.6-openjdk-11 AS build

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Build the WAR file
RUN mvn clean package

# Use Tomcat as the runtime image
FROM tomcat:9.0

# Copy the generated WAR file to Tomcat's webapps directory
COPY --from=build /app/target/CarParkingManagementSystem.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

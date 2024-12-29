FROM gradle:8.7.0-jdk21-alpine AS build
LABEL authors="rafanegrette"
ADD /build/libs/form-management-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
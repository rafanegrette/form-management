FROM gradle:8.7.0-jdk21-alpine AS build
LABEL authors="rafanegrette"
WORKDIR /home/gradle/project

COPY . .

RUN apk add gcompat

RUN gradle clean build

FROM gradle:8.7.0-jdk21-alpine
VOLUME /tmp
COPY --from=build /home/gradle/project/build/libs/*-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
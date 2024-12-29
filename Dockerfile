FROM gradle:8.7.0-jdk21-alpine AS build
LABEL authors="rafanegrette"
WORKDIR /workspace

COPY . .

RUN apk add gcompat

RUN gradle clean build

FROM gradle:8.7.0-jdk21-alpine
VOLUME /tmp
COPY --from=build /workspace/build/libs/*-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
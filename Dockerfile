FROM gradle:8.7.0-jdk21-alpine AS build
LABEL authors="rafanegrette"
WORKDIR /workspace/app

COPY . /workspace/app

RUN apk add gcompat

RUN gradle clean build

FROM gradle:8.7.0-jdk21-alpine
VOLUME /tmp
COPY --from=build /workspace/app/build/libs/*-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
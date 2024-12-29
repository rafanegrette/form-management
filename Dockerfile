FROM gradle:8.7.0-jdk21-alpine AS build
LABEL authors="rafanegrette"
WORKDIR /workspace/app

COPY gradlew .
COPY gradle gradle/
COPY build.gradle .
COPY settings.gradle .

# Make gradlew executable
RUN chmod +x gradlew

RUN apk add gcompat

# Then copy the rest of the source code
COPY src src/

# Use gradlew instead of gradle for better build reproducibility
RUN ./gradlew clean build --no-daemon

FROM gradle:8.7.0-jdk21-alpine
VOLUME /tmp
ARG DEPENDENCY=/workspace/app/build/
COPY --from=build ${DEPENDENCY}/libs/*-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
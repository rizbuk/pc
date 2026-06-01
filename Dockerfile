FROM maven:3.9.16-amazoncorretto-17-debian as builder
RUN apt update  

WORKDIR /app
COPY . .
RUN mvn package


FROM maven:3.9.16-amazoncorretto-17-debian

COPY  --from=builder /app/target/spring-petclinic-4.0.0-SNAPSHOT.jar .
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "app/spring-petclinic-4.0.0-SNAPSHOT.jar"]

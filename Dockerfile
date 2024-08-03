# Используем базовый образ OpenJDK 11
FROM openjdk:11-jre-slim

# Установите Maven
RUN apt-get update && \
    apt-get install -y maven

# Установите рабочую директорию
WORKDIR /app

# Скопируйте pom.xml и файлы исходного кода в контейнер
COPY pom.xml .
COPY src ./src

# Соберите проект с помощью Maven
RUN mvn clean package

# Скопируйте JAR-файл в корневую директорию контейнера
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

# Определите команду запуска приложения
ENTRYPOINT ["java", "-jar", "/app.jar"]

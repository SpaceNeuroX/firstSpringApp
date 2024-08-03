FROM openjdk:11-jre-slim

# Установите Maven
RUN apt-get update && \
    apt-get install -y maven

# Скопируйте исходный код в контейнер
COPY . /app

# Перейдите в директорию приложения
WORKDIR /app

# Соберите проект с помощью Maven
RUN mvn clean package

# Скопируйте JAR-файл в корневую директорию контейнера
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

# Определите команду запуска приложения
ENTRYPOINT ["java", "-jar", "/app.jar"]
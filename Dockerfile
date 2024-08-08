# Etapa de construcción utilizando una imagen de Maven con OpenJDK 17
FROM maven:3.8.4-openjdk-17 AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto al directorio de trabajo
COPY . .

# Construye tu aplicación con Maven
RUN mvn clean install

# Cambia a una imagen más ligera de OpenJDK 17 para la ejecución
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR de tu aplicación desde la etapa de construcción
COPY --from=build /app/target/mi-nombre-0.0.1-SNAPSHOT.jar .

# Exponer el puerto que utilizará la aplicación
EXPOSE 8080

# Define el comando de inicio de la aplicación
CMD ["java", "-jar", "mi-nombre-0.0.1-SNAPSHOT.jar"]

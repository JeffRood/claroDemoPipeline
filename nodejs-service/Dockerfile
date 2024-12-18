# Usa una imagen base que ya tenga Node.js (en Ubuntu)
FROM node:16

# Define el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos necesarios para instalar las dependencias
COPY package*.json ./

# Instala las dependencias de la aplicación
RUN npm install

# Copia el resto del código de tu backend
COPY . .

# Expon el puerto en el que la aplicación estará escuchando
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "src/app.js"]

# Contruir la imagen
Para construir la imagen, ejecutar:
`docker build -t debian-con-apache:private .`
- Si lo deseas, puedes cambiar el nombre y la etiqueta de la imagen

# Crear y arrancar contenedor
Para crear y arrancar el contendor, ejecutar:
`docker run --name debian-con-apache -p 8080:80 -p 444:443 -d debian-con-apache:private`
- Si lo deseas, puedes cambiar el nombre del contendor y el mapeo del puerto
# Imagem de trabalho
FROM python:3.13.0

# Diretório de trabalho 
WORKDIR /app

# Copia arquivo requirement para a imagem de trabalho   
COPY requirements.txt .

# Comando de instalação das dependencias
RUN pip install -r requirements.txt

# Cópia dos arquivos
COPY . /app/

# Declara a porta 5000
EXPOSE 5000

# Comando para execução do container
CMD [ "gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

################################################################################
# Comando no terminal para a criação do container: docker build -t ricardogomes335/conversao-distancia:v1 .
# Comando no terminal para rodar container: docker container run -d -p 8181:5000 conversao-distancia
# Comando no terminal para remover container: docker container rm -f 696957640dab
# comando para subir o projeto para o Docker Hub
# 1 docker login ( digitar usuario e senha)
# 2 docker push ricardogomes335/conversao-distancia:v1
# adicionar versão latest do projeto: docker tag ricardogomes335/conversao-distancia:v1 ricardogomes335/conversao-distancia:latest
# subir a ultima versão modificada: docker push ricardogomes335/conversao-distancia:latest
# rodar o container remotamente com a imagem do Docker Hub: docker container run -d -p 8080:5000 ricardogomes335/conversao-distancia:latest
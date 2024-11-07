# Imagem de trabalho
FROM python
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
# Comando no terminal: docker build -t conversao-distancia -f Dockerfile .
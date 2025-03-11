#!/bin/bash

# Atualizar o servidor
echo "Atualizando o servidor..."
sudo apt update && sudo apt upgrade -y

# Instalar apache2 e unzip
echo "Instalando apache2 e unzip..."
sudo apt install apache2 unzip -y

# Baixar o arquivo zip do repositório
echo "Baixando o arquivo zip do repositório..."
wget -O /tmp/linux-site-dio.zip https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

# Descompactar o arquivo zip
echo "Descompactando o arquivo zip..."
unzip -o /tmp/linux-site-dio.zip -d /tmp/

# Copiar os arquivos da aplicação para o diretório padrão do Apache
echo "Copiando os arquivos para o diretório do Apache..."
sudo cp -r /tmp/linux-site-dio-main/* /var/www/html/

# Ajustar permissões do diretório do Apache
echo "Ajustando permissões do diretório do Apache..."
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Reiniciar o serviço do Apache
echo "Reiniciando o serviço do Apache..."
sudo systemctl restart apache2

# Limpar arquivos temporários
echo "Limpando arquivos temporários..."
rm -rf /tmp/linux-site-dio.zip /tmp/linux-site-dio-main

echo "Processo concluído! O site foi implantado com sucesso."

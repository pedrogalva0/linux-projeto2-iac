#!/bin/bash

# Parar o script se algum comando falhar
set -e

echo "Atualizando o servidor"

# Atualizar o sistema
apt-get update
apt-get upgrade -y

# Instalar Apache e unzip
apt-get install apache2 -y
apt-get install unzip -y

echo "Baixando e copiando os arquivos da aplicação"

# Baixar e extrair o site
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip

# Copiar os arquivos para o diretório do Apache
cd linux-site-dio-main
cp -R * /var/www/html

# Ajustar permissões (opcional, dependendo do ambiente)
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Limpar arquivos temporários
rm -f /tmp/main.zip
rm -rf /tmp/linux-site-dio-main

echo "Instalação concluída com sucesso!"

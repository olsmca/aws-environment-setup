#!/bin/bash

# Instalador de herramientas necesarias para AWS Environment Setup
echo "Instalando herramientas necesarias..."

# Detectar el sistema operativo
OS=$(uname -s)

case "$OS" in
  Linux)
    echo "Sistema operativo detectado: Linux"
    sudo apt-get update
    sudo apt-get install -y unzip curl git
    ;;
  Darwin)
    echo "Sistema operativo detectado: macOS"
    brew update
    brew install git unzip curl
    ;;
  *)
    echo "Sistema operativo no soportado automáticamente."
    exit 1
    ;;
esac

# Instalar AWS CLI
echo "Instalando AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Instalar Terraform
echo "Instalando Terraform..."
TERRAFORM_VERSION="1.6.0"
curl -O "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Configuración final
echo "Instalación completa. Verifica las versiones:"
terraform version
aws --version

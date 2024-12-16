# AWS Environment Setup

## Descripción
Este proyecto permite aprovisionar servicios en AWS (API Gateway, Cognito, Lambda, SQS y S3) de manera sencilla utilizando un menú interactivo.

## Requisitos
1. **Git**
2. **Terraform**
3. **AWS CLI**

## Instalación
Ejecuta el siguiente comando

#### Clonar el repositorio:
```bash
git clone <URL_DEL_REPOSITORIO>
cd aws-environment-setup
```

#### Dar permisos de ejecucion al script:
```bash
chmod +x scripts/setup_wizard.sh
chmod +x scripts/install_tools.sh
```

#### Instalar las herramientas necesarias:
Ejecuta el siguiente comando para instalar todas las herramientas necesarias:
```bash
bash scripts/install_tools.sh
```

#### Ejecutar el wizard:
```bash
bash scripts/setup_wizard.sh
```

#### Inicializar y aplicar Terraform:
```bash
terraform init
terraform apply -auto-approve
```
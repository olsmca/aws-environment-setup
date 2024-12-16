#!/bin/bash

# Variables iniciales
TFVARS_FILE="terraform.tfvars"

# Función para mostrar el encabezado
function show_header {
    clear
    echo "=============================="
    echo "   AWS Environment Setup Wizard   "
    echo "=============================="
    echo ""
}

# Función para generar terraform.tfvars
function generate_tfvars {
    cat <<EOF > $TFVARS_FILE
environment_name = "${ENV_NAME}"
aws_region       = "${AWS_REGION}"
enable_api_gateway = $( [[ "$SELECTED_SERVICES" =~ "API Gateway" ]] && echo "true" || echo "false" )
enable_cognito     = $( [[ "$SELECTED_SERVICES" =~ "Cognito" ]] && echo "true" || echo "false" )
enable_lambda      = $( [[ "$SELECTED_SERVICES" =~ "Lambda" ]] && echo "true" || echo "false" )
enable_sqs         = $( [[ "$SELECTED_SERVICES" =~ "SQS" ]] && echo "true" || echo "false" )
enable_s3          = $( [[ "$SELECTED_SERVICES" =~ "S3" ]] && echo "true" || echo "false" )
EOF
    echo "Archivo terraform.tfvars generado correctamente."
}

# Función para ejecutar Terraform
function run_terraform {
    echo "Inicializando Terraform..."
    terraform init > /dev/null
    echo "Aplicando configuración..."
    terraform apply -var-file=$TFVARS_FILE -auto-approve
    echo "¡Provisionamiento completado exitosamente!"
}

# Iniciar el menú
while true; do
    show_header
    echo "Menú principal:"
    echo "1. Configurar entorno"
    echo "2. Seleccionar servicios"
    echo "3. Ejecutar Terraform"
    echo "4. Salir"
    echo ""

    # Leer la opción del usuario
    read -p "Seleccione una opción (1-4): " OPTION

    case $OPTION in
        1)
            show_header
            echo "Configuración del entorno"
            read -p "Ingrese el nombre del entorno (e.g., dev, staging, prod): " ENV_NAME
            read -p "Ingrese la región de AWS (default: us-east-1): " AWS_REGION
            AWS_REGION=${AWS_REGION:-us-east-1}
            echo "Entorno configurado: $ENV_NAME en región $AWS_REGION"
            ;;
        2)
            show_header
            echo "Seleccionar servicios"
            echo "1. API Gateway"
            echo "2. Cognito"
            echo "3. Lambda"
            echo "4. SQS"
            echo "5. S3"
            echo "6. Todos"
            echo ""

            read -p "Ingrese los números separados por comas (e.g., 1,3,5): " SERVICES
            SERVICES_ARRAY=($(echo $SERVICES | tr "," "\\n"))
            SELECTED_SERVICES=""
            for SERVICE in "${SERVICES_ARRAY[@]}"; do
                case $SERVICE in
                    1) SELECTED_SERVICES+="API Gateway, ";;
                    2) SELECTED_SERVICES+="Cognito, ";;
                    3) SELECTED_SERVICES+="Lambda, ";;
                    4) SELECTED_SERVICES+="SQS, ";;
                    5) SELECTED_SERVICES+="S3, ";;
                    6) SELECTED_SERVICES="API Gateway, Cognito, Lambda, SQS, S3"; break;;
                    *) echo "Opción inválida: $SERVICE";;
                esac
            done
            echo "Servicios seleccionados: ${SELECTED_SERVICES%, }"
            ;;
        3)
            show_header
            echo "Ejecutando Terraform"
            if [[ -z "$ENV_NAME" || -z "$AWS_REGION" || -z "$SELECTED_SERVICES" ]]; then
                echo "Error: Configuración incompleta. Por favor, configure el entorno y los servicios primero."
            else
                generate_tfvars
                run_terraform
            fi
            ;;
        4)
            echo "Saliendo del asistente. ¡Gracias por usar el AWS Environment Setup Wizard!"
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, intente de nuevo."
            ;;
    esac

    # Pausa antes de volver al menú
    read -p "Presione Enter para continuar..."
done

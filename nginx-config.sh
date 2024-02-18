#!/bin/bash

# Função para configurar site como proxy reverso
configure_proxy() {
    echo "Configurando site como proxy reverso..."
    read -p "Informe o domínio do site: " domain
    read -p "Informe a URL do servidor de destino: " backend_url

    # Crie o arquivo de configuração do Nginx
    cat > "/etc/nginx/sites-available/$domain" <<EOF
server {
    listen 80;
    server_name $domain;

    location / {
        proxy_pass $backend_url;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

    # Crie um link simbólico para ativar o site
    ln -s "/etc/nginx/sites-available/$domain" "/etc/nginx/sites-enabled/"

    # Recarregue a configuração do Nginx
    systemctl reload nginx

    echo "Proxy reverso configurado com sucesso para $domain!"
}

# Função para configurar site como servidor de arquivos estáticos
configure_static() {
    echo "Configurando site como servidor de arquivos estáticos..."
    read -p "Informe o domínio do site: " domain
    read -p "Informe o caminho do diretório de arquivos estáticos: " static_path

    # Crie o arquivo de configuração do Nginx
    cat > "/etc/nginx/sites-available/$domain" <<EOF
server {
    listen 80;
    server_name $domain;

    location / {
        root $static_path;
        index index.html;
        try_files \$uri \$uri/ =404;
    }
}
EOF

    # Crie um link simbólico para ativar o site
    ln -s "/etc/nginx/sites-available/$domain" "/etc/nginx/sites-enabled/"

    # Recarregue a configuração do Nginx
    systemctl reload nginx

    echo "Servidor de arquivos estáticos configurado com sucesso para $domain!"
}

# Menu principal
echo "Bem-vindo ao configurador de sites Nginx!"
echo "Selecione o tipo de site que deseja configurar:"
echo "1. Proxy Reverso"
echo "2. Servidor de Arquivos Estáticos"

read -p "Opção (1 ou 2): " option

case $option in
    1) configure_proxy ;;
    2) configure_static ;;
    *) echo "Opção inválida. Saindo." ;;
esac

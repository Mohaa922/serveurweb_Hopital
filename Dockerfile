# Utiliser une image Nginx
FROM nginx:alpine

# Copier ton index.html dans le répertoire web d’nginx
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

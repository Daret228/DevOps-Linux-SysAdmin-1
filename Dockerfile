# Используем официальный образ nginx:stable
FROM nginx:stable

# Копируем свой index.html в директорию nginx, чтобы он отображался на главной странице
COPY index.html /usr/share/nginx/html/index.html

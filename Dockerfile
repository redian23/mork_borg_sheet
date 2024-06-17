# Используем официальный образ Alpine Linux с nginx
FROM nginx:alpine

# Удаляем стандартную конфигурацию nginx
RUN rm /etc/nginx/conf.d/default.conf

# Копируем наш собственный конфигурационный файл nginx
COPY config/nginx.conf /etc/nginx/conf.d/

# Копируем статические файлы (HTML, CSS и т.д.)
COPY html /usr/share/nginx/html

# Экспонируем порт 80
EXPOSE 80

# Запускаем nginx в foreground режиме
CMD ["nginx", "-g", "daemon off;"]
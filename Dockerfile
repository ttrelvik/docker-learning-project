# Use the official Nginx image as the base
FROM nginx

# Copy our custom index.html to the web server's root directory
COPY ./index.html /usr/share/nginx/html/index.html

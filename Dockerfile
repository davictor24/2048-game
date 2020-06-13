# Use Nginx base image
FROM nginx:alpine

# Copy game to Nginx folder for static hosting
COPY game /usr/share/nginx/html

# Set the application's port number
EXPOSE 80
#########################################
# Docker file
# run it in an nginx container
#########################################


#########################################
# run the nginx
#########################################
FROM nginx:stable-alpine
LABEL maintainer="Anne Ferger for the ViFE"

# copy the vife web client
COPY index.html /var/www/html/
COPY js/ /var/www/html/js/
COPY css/ /var/www/html/css/

RUN chown nginx:nginx /var/www/html

# Copy the respective nginx configuration files
COPY nginx_config/default.conf /etc/nginx/conf.d/default.conf



EXPOSE 8080

# start nginx and keep the process from backgrounding and the container from quitting
CMD ["nginx", "-g", "daemon off;"]

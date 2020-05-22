  
# base image
FROM nginx:latest


WORKDIR /app/nginx-server

# remove the default config file
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

# wait for web-ui then start up
CMD ["/app/wait-for-it.sh", "authentication-api:3000", "-t", "0", "--", "nginx", "-g", "daemon off;"]
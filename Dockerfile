  
# base image
FROM nginx:latest


WORKDIR /app/nginx

# remove the default config file
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

# wait for web-ui then start up
CMD ["/app/wait-for-it.sh", "users-api:80", "-t", "0", "--", "nginx", "-g", "daemon off;"]
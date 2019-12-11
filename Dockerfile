FROM ubuntu
MAINTAINER AzureTeam-B
RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx -y
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
COPY index.html /var/www/html/index.html
ENTRYPOINT ["date"]

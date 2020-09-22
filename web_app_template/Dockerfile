FROM nginx:1.19.0
COPY src /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d/
#COPY nginx/installer.sh /tmp/installer.sh
#RUN /tmp/installer.sh
#RUN rm -R /tmp/installer.sh
RUN apt-get update -y 
EXPOSE 80
#EXPOSE 443
CMD ["nginx","-g","daemon off;"]

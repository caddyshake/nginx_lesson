FROM nginx:stable
MAINTAINER Andrii Kirin
ENV NAME=Vika
ENV AGE=12

COPY ./script.sh /root/script.sh
RUN chmod +x /root/script.sh
CMD /root/script.sh && nginx -g 'daemon off;'
#ENTRYPOINT ["bash","/root/script.sh", ";", " nginx -g daemon off;"]

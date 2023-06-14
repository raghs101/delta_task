FROM ubuntu:18.04
RUN apt-get update && apt-get install -y apache2
RUN mkdir -p /exec
RUN mkdir -p /home/HAD
COPY mess.txt /home/HAD
COPY . /exec
RUN chmod +x /exec/genStudent.sh
RUN ./exec/genStudent.sh /exec/studentDetails.txt


EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]


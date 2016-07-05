FROM java:8
MAINTAINER Sandhya Nayak

RUN echo setting environments JAVA_HOME ,PATH
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

RUN echo Uncomment if required. The below line is used for setting timezone to match the connecting machine.
#RUN echo "Europe/London" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

RUN echo installing tomcat at location /usr/local/tomcat/
WORKDIR /usr/local/
RUN wget -q https://www.apache.org/dist/tomcat/tomcat-8/v8.0.36/bin/apache-tomcat-8.0.36.zip \
 && unzip apache-tomcat-8.0.36.zip \
 && mv apache-tomcat-8.0.36 tomcat
RUN rm apache-tomcat-8.0.36.zip

RUN echo adding admin and manager user to tomcat config
WORKDIR $CATALINA_HOME/bin
ADD create_admin_user.sh .
RUN chmod 777 $CATALINA_HOME/bin/*.sh
RUN ./create_admin_user.sh
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]

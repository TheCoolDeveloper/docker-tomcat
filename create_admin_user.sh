#!/bin/bash
sed -i '$ d' ${CATALINA_HOME}/conf/tomcat-users.xml
echo "Creating admin user with password admin in Tomcat"

echo "<role rolename=\"manager-gui\"/>" >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo "<user username=\"admin\" password=\"admin\" roles=\"manager-gui\"/>" >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo "</tomcat-users>" >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo "Admin User created"

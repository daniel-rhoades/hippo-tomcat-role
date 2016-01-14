hippo-tomcat-role
=================
Ansible role for configuring Tomcat to run Hippo as per Hippo documentation [configure the application server (Apache Tomcat on Linux)](http://www.onehippo.org/library/enterprise/installation-and-configuration/linux-installation-manual.html).

Currently only supports a MySQL Content Repository.

Requirements
------------
Note, Tomcat is required to be installed first, for an appropriate role see [daniel-rhoades.tomcat](https://github.com/daniel-rhoades/tomcat-role).

Role Variables
--------------
- tomcat_system_user: System user that will run Tomcat (default "cms")
- tomcat_system_group: System user group that will run Tomcat (default "cms")
- tomcat_system_home: Home directory of the system user that will run Tomcat (default "/opt/{{ tomcat_system_user }}")
- tomcat_catalina_home: Directory where Tomcat will be extracted into (default "/usr/local/tomcat")
- tomcat_catalina_base: Directory which will hold custom Tomcat config (default "{{ tomcat_system_home }}/tomcat")
- hippo_jta_jar: JTA JAR file to be used as required by Hippo (default "http://search.maven.org/remotecontent?filepath=org/apache/geronimo/specs/geronimo-jta_1.1_spec/1.1/geronimo-jta_1.1_spec-1.1.jar")
- hippo_javamail_jar: JavaMail file to be used as required by Hippo (default "http://search.maven.org/remotecontent?filepath=javax/mail/mail/1.4.7/mail-1.4.7.jar")
- hippo_jcr_jar: JCR file to be used as required by Hippo (default "http://search.maven.org/remotecontent?filepath=javax/jcr/jcr/2.0/jcr-2.0.jar")
- hippo_mysql_jar: MySQL driver JAR (default "http://search.maven.org/remotecontent?filepath=mysql/mysql-connector-java/5.1.36/mysql-connector-java-5.1.36.jar")

Dependencies
------------
daniel-rhoades.tomcat

Example Playbook
----------------
For a usage example see [hippo-tomcat-template](https://github.com/daniel-rhoades/hippo-tomcat-template).

License
-------
MIT

Author Information
------------------
Daniel Rhoades (https://github.com/daniel-rhoades)
#! /bin/sh
JAVA_HOME=/usr/java/default
JAVA_ENDORSED_DIRS=/usr/local/share/tomcat-endorsed

CATALINA_HOME="/usr/local/tomcat"
CATALINA_BASE="/opt/cms/tomcat"
CATALINA_PID="${CATALINA_BASE}/work/catalina.pid"

CLUSTER_ID="$(whoami)-$(hostname -f)"

MAX_HEAP=512
MIN_HEAP=256

REP_OPTS="-Drepo.bootstrap=true -Drepo.config=file:${CATALINA_BASE}/conf/repository.xml"
JVM_OPTS="-server -Xmx${MAX_HEAP}m -Xms${MIN_HEAP}m -XX:+UseG1GC -Djava.util.Arrays.useLegacyMergeSort=true"
DMP_OPTS="-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/opt/cms/heapdumps"
RMI_OPTS="-Djava.rmi.server.hostname=127.0.0.1"
JRC_OPTS="-Dorg.apache.jackrabbit.core.cluster.node_id=${CLUSTER_ID}"
L4J_OPTS="-Dlog4j.configuration=file:${CATALINA_BASE}/conf/log4j.xml"

# Run environment scripts in ${USER_HOME}/environment

for SCRIPT in ${USER_HOME}/environment/*
do
    if [ -f $SCRIPT -a -x $SCRIPT ]
    then
        eval "$($SCRIPT)"
    fi
done

CONTENTSTORE_OPTS="-Dhippo.contentstore.username=${HIPPO_CONTENTSTORE_USERNAME} -Dhippo.contentstore.password=${HIPPO_CONTENTSTORE_PASSWORD} -Dhippo.contentstore.url=${HIPPO_CONTENTSTORE_URL}"

CATALINA_OPTS="${JVM_OPTS} ${REP_OPTS} ${DMP_OPTS} ${RMI_OPTS} ${L4J_OPTS} ${JRC_OPTS} ${CONTENTSTORE_OPTS}"

export JAVA_HOME CATALINA_HOME CATALINA_BASE
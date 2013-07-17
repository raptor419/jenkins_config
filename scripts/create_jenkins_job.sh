#!/bin/bash

# variables
JOB_NAME=$1
JENKINS_HOME=/var/lib/jenkins
SCRIPTS_PATH=${JENKINS_HOME}/jenkins_config/scripts
CONFIG_FILE_PATH=${JENKINS_HOME}/jenkins_config/jobs/template_job/config.xml
JOB_PATH=${JENKINS_HOME}/jobs/${JOB_NAME}

# creating job directory
if [ ! -d ${JOB_PATH} ];
then
	mkdir ${JOB_PATH}
	cp ${CONFIG_FILE_PATH} ${JOB_PATH}

	# reloading configuration
	#wget http://localhost:8080/jnlpJars/jenkins-cli.jar
	java -jar jenkins-cli.jar -s http://localhost:8080 reload-configuration

	echo "Created new jenkins job $JOB_NAME"
fi


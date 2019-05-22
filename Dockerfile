# Pull base image.
FROM dockerfile/ubuntu

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer


# Define working directory.
WORKDIR /opt/application

#Copy files
COPY $JAVA_HOME/lib/* /usr/lib/jvm/java-8-oracle/lib/
COPY conf/config.yaml /opt/application
COPY build/app.jar /opt/application

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV APPLICATION_CONFIG /opt/application/config.yaml

# Define default command.
CMD ["/usr/bin/java -jar /opt/application/app.jar"]
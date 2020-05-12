FROM centos:7

RUN yum update -y && \
    yum install -y java-1.8.0-openjdk-headless && \
    yum clean all

ENV JAVA_HOME=/usr/java/default/ \
    ZK_HOSTS=localhost:2181 \
    CMAK_VERSION=2.0.0.2 \
    CMAK_CONFIGFILE="conf/application.conf"
    #CMAK_USERNAME=admin \
    #CMAK_PASSWORD=password \

RUN yum install -y java-1.8.0-openjdk-devel git wget unzip which vim && \
    echo 1

RUN mkdir -p /tmp && cd /tmp && \
    echo 2 && \
    wget https://github.com/yahoo/CMAK/archive/${CMAK_VERSION}.tar.gz && \
    echo 3 && \
    tar -zxvf ${CMAK_VERSION}.tar.gz && \
    echo 4

RUN cd /tmp/CMAK-${CMAK_VERSION} && ./sbt clean dist

RUN unzip -o -d / /tmp/CMAK-${CMAK_VERSION}/target/universal/kafka-manager-${CMAK_VERSION}.zip

#temp for debugging
#CMD ["tail", "-f", "/dev/null"]

ADD start-cmak.sh /kafka-manager-${CMAK_VERSION}/start-cmak.sh

RUN chmod +x /kafka-manager-${CMAK_VERSION}/start-cmak.sh

WORKDIR /kafka-manager-${CMAK_VERSION}

EXPOSE 9000

ENTRYPOINT ["./start-cmak.sh"]

# CMAK(kafka manager) Dockerfile
[CMAK](https://github.com/yahoo/CMAK) is a tool from Yahoo Inc. for managing [Apache Kafka](http://kafka.apache.org).

## Docker hub 
[sanjosebadger/kafka-manager](https://hub.docker.com/r/sanjosebadger/kafka-manager)

## Base Docker Image ##
* [centos:7](https://hub.docker.com/_/centos/)

## Howto
### Quick Start
```
docker run -it --rm  -p 9000:9000 -e ZK_HOSTS="your-zk.domain:2181" sanjosebadger/kafka-manager
```
(if you don't define ZK_HOSTS, default value has been set to "localhost:2181")




### Note
I forked from sheepkiller/kafka-manager-docker repo and updated files to recent versions. 

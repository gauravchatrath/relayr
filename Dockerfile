FROM python:3.4-alpine
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
FROM debian:jesse

RUN apt-get update && apt-get install -y openjdk-7-jre-headless wget
RUN wget -q -O - http://mirror.csclub.uwaterloo.ca/apache/zookeeper/zookeeper-3.4.7/zookeeper-3.4.7.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-3.4.7 /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg

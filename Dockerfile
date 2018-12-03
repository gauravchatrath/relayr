FROM python:3.4-alpine
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
FROM debian:jesse
RUN apt-get update && apt-get install -y openjdk-7-jre-headless wget
RUN wget -q -O - http://mirrors.wuchna.com/apachemirror/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-3.4.10 /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg
EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "tmp/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]

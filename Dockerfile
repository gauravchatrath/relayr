FROM python:3.4-alpine
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
FROM quay.io/coreos/etcd
COPY boot.sh .
EXPOSE 2379 2380
CMD ["./boot.sh"]

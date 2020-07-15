FROM python:3.6-alpine

COPY . /proxypool

WORKDIR /proxypool

RUN echo "https://mirrors.aliyun.com/alpine/v3.6/main/" > /etc/apk/repositories \
  && apk update \
  && apk add --nocache libxml2 libxml2-dev libxslt libxslt-dev \
  && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt

EXPOSE 5000

ENV REDIS_HOST='localhost'
ENV REDIS_PORT=6379

ENTRYPOINT ["python run.py"]

FROM python:3.6-alpine

COPY . /proxypool

WORKDIR /proxypool

RUN pip install -r requirements.txt

EXPOSE 5000

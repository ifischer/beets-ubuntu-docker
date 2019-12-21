FROM python:3.7.4-slim

ENV DEBIAN_FRONTEND noninteractive
ENV PYTHONUNBUFFERED 1

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y sqlite3 wget zlib1g-dev libjpeg62-turbo-dev gcc \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

WORKDIR /code
COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . /code

EXPOSE 8000

# Version: 0.0.1

FROM python

ARG SPIDER = "spider.py"

RUN apt-get update && apt-get upgrade -y
RUN pip install --upgrade pip
RUN pip install scrapy

CMD  scrapy runspider /scrapy/$SPIDER -o /scrapy/result.json

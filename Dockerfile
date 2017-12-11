# Version: 0.0.1

FROM python


RUN apt-get update && apt-get upgrade -y
RUN pip install --upgrade pip
RUN pip install scrapy

CMD  scrapy runspider /scrapy/quotes_spider.py -o /scrapy/quotes.json

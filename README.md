
Now we’re creating a shared volume which will be mounted to container and place test spider to that volume

In mounted dir must be a directory scrapy in which must be spider.py

$ sudo docker run -v ~/Scrapy/scrapy-data:/scrapy scrapy  scrapy runspider /scrapy/quotes_spider.py -o /scrapy/quotes.json


-v ~/Scrapy/scrapy-data:/scrapy means that in our container directory ~/Scrapy will be created a shared volume that is mounted to /scrapy of container. 

scrapy runspider /scrapy/quotes_spider.py -o /scrapy/quotes.json - command that will be run in container


file  ~/Scrapy/scrapy-data/quotes.json

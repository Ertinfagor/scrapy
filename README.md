
Now we’re creating a shared volume which will be mounted to container and place test spider to that volume

$ mkdir ~/Scrapy/scrapy-data

$ cd ~/Scrapy/scrapy-data

$ sudo nano


import scrapy


class QuotesSpider(scrapy.Spider):

    name = "quotes"

    start_urls = [

        ' http://quotes.toscrape.com/tag/humor/',

    ]


    def parse(self, response):

        for quote in response.css('div.quote'):

            yield {

                'text': quote.css('span.text::text').extract_first(),

                'author': quote.xpath('span/small/text()').extract_first(),

            }


        next_page = response.css('li.next a::attr("href")').extract_first()

        if next_page is not None:

            yield response.follow(next_page, self.parse)


    Build image



$ sudo docker run -v ~/Scrapy/scrapy-data:/scrapy scrapy  scrapy runspider /scrapy/quotes_spider.py -o /scrapy/quotes.json


-v ~/Scrapy/scrapy-data:/scrapy means that in our container directory ~/Scrapy will be created a shared volume that is mounted to /scrapy of container. 

scrapy runspider /scrapy/quotes_spider.py -o /scrapy/quotes.json - command that will be run in container


file  ~/Scrapy/scrapy-data/quotes.json

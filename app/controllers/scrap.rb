# parse stock data from BLOOMBERG .com
def parse_set(quote)
  var = "https://www.bloomberg.com/quote/" + quote + ":TB"
  collect = []
  scrap = Nokogiri::HTML(open(var)).css("div.quote-page").each do |url|
    price    = url.css("div.price-container div.price").children.text
    change   = url.css("div.price-container div.change-container div").children[0].text
    cPercent = url.css("div.price-container div.change-container div").children[1].text
    updated  = url.css("div.price-datetime").children.text
    range    = url.css("div.detailed-quote div.data-table div.cell div.cell__value").children[1].text
    yearRange = url.css("div.detailed-quote div.data-table div.cell div.cell__value").children[4].text
    volumn   = url.css("div.detailed-quote div.data-table div.cell div.cell__value").children[2].text
    collect << [ price, change, cPercent, updated, range, yearRange, volumn ]
    # puts collect
    return collect
  end
end

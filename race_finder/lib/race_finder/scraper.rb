class RaceFinder::Scraper
  def self.get_page(index)
    Nokogiri::HTML(open(index))
  end
  def self.get_detail(url)
    Nokogiri::HTML(open(url))
  end

  def self.scrape_index(index)
    races = []
    html_block = self.get_page(index).css("table#calendarlist tr")
    html_block.each {|r|
      #binding.pry
      d = r.css("td")
        if d.size > 0 && d[0]["class"] != "gad"
            #binding.pry
            races << {
                :type => d[0].text,
                :date => d[1].text,
                :name => d[2].text,
                :url => d[2].css("a").attribute("href").value,
                :location => d[3].text
            }
        end
    }
    races
  end
  
  def self.scrape_detail(url)
    detail = self.get_detail(url)
    data = {
    :description => detail.css("p#info").text.split.join(" ")
    }
    data
  end
  #def self.scrape_detail_xpath(url)
    #detail = self.get_detail(url)
    #data = {
    #  :phone => detail.xpath("/html/body/div[3]/div[2]/div[1]/div[2]").text.split.join(" ")
    # }
  #end
end
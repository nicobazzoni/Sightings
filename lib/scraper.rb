class Scraper 
     
    'https://www.mufon.com/historical.html'
    
    
    def initialize(url)
     @url = url 
     
     end
    
    
           
    def scrape_mufon_data
            
        page = Nokogiri::HTML(open(@url))
        results = page.css("h2.wsite-content-title a") 
                
        results.shift
                
        results = results[0..20]
        results.each_with_index do |node, i|
            index = i+1 
            name = node.text.split(" - ")[0]
            date = node.text.split(" - ")[1]
            url  = "https://www.mufon.com"+node["href"]

            
            Sighting.new(index, name, date, url)
            
        end
        
    end
    
    def user_choice_scrape
        page = Nokogiri::HTML(open(@url))
        text = page.css("div#wsite-content div.paragraph").text 
        return text.split(" ").first(100).join(" ") + "..." 
        
    end
   


           
            
           
 
    

end



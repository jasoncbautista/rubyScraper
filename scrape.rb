require 'nokogiri'
require 'open-uri'

# Get a Nokogiri::HTML::Document for the page we’re interested in...

doc = Nokogiri::HTML(open('http://www.ufc.com/fighter/Weight_Class/Bantamweight?offset=20&max=20&sort=lastName&order=asc'))

# Do funky things with it using Nokogiri::XML::Node methods...

####
# Search for nodes by css
doc.css('tr.fighter').each do |link|
    # puts link.content
    # Find fighter names:
    names = link.css('a.fighter-name')

    puts names.first.content



    

end


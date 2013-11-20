require 'nokogiri'
require 'open-uri'

# Get a Nokogiri::HTML::Document for the page we’re interested in...

doc = Nokogiri::HTML(open('http://www.ufc.com/fighter/Weight_Class/Bantamweight?offset=20&max=20&sort=lastName&order=asc'))

# Do funky things with it using Nokogiri::XML::Node methods...

####
# Search for nodes by css
doc.css('tr.fighter').each do |fighterCard|
    # puts link.content
    # Find fighter names:
    names = fighterCard.css('a.fighter-name')

    puts names.first.content

    cells = fighterCard.css(".cell-inner")

    # [0] = Name 
    # [1] = Record 
    # [2] = Height
    # [3] = Weight

    recordCell = cells[1]
    heightCell = cells[2]
    weightCell = cells[3]


    puts weightCell


end


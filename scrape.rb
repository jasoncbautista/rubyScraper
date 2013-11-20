require 'nokogiri'
require 'open-uri'

# Get a Nokogiri::HTML::Document for the page we’re interested in...


myFile = "./jsonFighters.txt"
 File.open(myFile, 'w') { |file|
     file.write(" {  fighters: [ \n") 
 
     fighterCount = 0

    ii = 0
    max = 2


    while ii < max do
        offset = 20*ii
        ii+=1
        doc = Nokogiri::HTML(open('http://www.ufc.com/fighter/Weight_Class?offset=' + offset.to_s + '&max=20&sort=lastName&order=asc'))

        # Do funky things with it using Nokogiri::XML::Node methods...

        ####
        # Search for all the fighters in the page
        doc.css('tr.fighter').each do |fighterCard|
            begin
            # Find fighter names:
                names = fighterCard.css('a.fighter-name')

                name = names.first.content

                cells = fighterCard.css(".cell-inner")

                # Get other MISC info:
                
                # [0] = Name 
                # [1] = Record 
                # [2] = Height
                # [3] = Weight

                recordCell = cells[1]
                heightCell = cells[2]
                weightCell = cells[3]


                # Extract the weight
                weightLB = weightCell.css(".main-txt").first.content

                # Extract the height:
                heightCM = weightCell.css(".sub-txt").first.content

                
                # Prepare js
                jsonName = " 'name' :  \"" + name.strip + "\""
                jsonWeight = ", 'weight': \"" + weightLB.strip + "\""
                jsonHeight= ", 'height': \"" + heightCM.strip + "\""
                str = jsonName + jsonWeight + jsonHeight

                # Write out to file (as json)
                if fighterCount != 0 
                    file.write(" ,  ") 
                end
                puts name

                file.write(" {  ") 
                file.write(str)
                file.write(" } \n ") 
                fighterCount+=1
            rescue
                puts "Bad node"
            end

        end

    end

    file.write("   ] }\n") 
 }

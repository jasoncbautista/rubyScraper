myFile = "./testing.txt"
 File.open(myFile, 'w') { |file|
     file.write("your text \n") 
     file.write("your text") 
 }

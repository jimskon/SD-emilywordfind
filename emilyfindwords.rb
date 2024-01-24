def getFile(name)
    fileObj = File.open(name)
    fileObj.read()
end

def wordCountTable(filename)
    text = getFile(filename)
    words = text.split(" ")
    table = {}
    words.each do |w|
        # Remove punctuation, make lower case
        w=w.gsub(/\W/, ' ').downcase  
        # either make new entry, or increment entry
        if table.key?(w)
            table[w] = table[w]+1
        else 
            table[w] = 1
        end
    end
    print table.class,"\n"
    table
 end

def displayTableAlpha(table)
    table = Hash[table.sort_by { |key, value| key}]
    table.each do |key,word|
        print key,"->",word,"\n"
    end
end

def displayTableCount(table)
    table = Hash[table.sort_by { |key, value| value}]
    table.each do |key,word|
        print key,"->",word,"\n"
    end
end

def lookupWords(table)
    print table.class,"\n"
    while true
        print "word to lookup:"
        w = gets.chomp
        if w.length<1
            break
        end
        if table.key?(w)
            print w," occurs ",table[w]," times.","\n"
        else 
            print w," not in text","\n"
        end 
    end 
end  

table=wordCountTable("emilydickenson.txt")
print "total uniqu words:",table.length,"\n"
displayTableCount(table)
lookupWords(table)

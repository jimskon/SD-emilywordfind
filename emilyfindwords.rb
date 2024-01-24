$lines = []
def getFile(name)
    fileObj = File.open(name)
    fileObj.read()
end

def wordLineTable(filename)
    text = getFile(filename)
    $lines = text.split("\n")
    table = {}
    lineNm = 0
    $lines.each do |l|
        words = l.split(" ")
        words.each do |w|
            # Remove punctuation, make lower case
            w=w.gsub(/\W/, ' ').downcase  
            # either make new entry, or increment entry
            if table.key?(w)
                table[w]<<lineNm
            else
                table[w] = [lineNm] 
            end
        end
        lineNm=lineNm+1
    end

    table
 end

def displayTableAlpha(table)
    table = Hash[table.sort_by { |key, value| key}]
    table.each do |key,list|
        print key,"->",list,"\n"
    end
end

def printMatchingLines(table,word)
    results = []
    prev = -1
    if table.key?(word)
        table[word].each do |index|
            if index!=prev
                print index,". ",$lines[index],"\n"
            end
            prev = index
        end
    else
        print word, " Not found","\n"
    end  
end  

def lookupWords(table)
    while true
        print "word to lookup:"
        w = gets.chomp
        if w.length<1
            break
        end
        printMatchingLines(table,w)
    end 
end  

table=wordLineTable("emilydickenson.txt")
print "total uniqu words:",table.length,"\n"
#displayTableAlpha(table)
lookupWords(table)

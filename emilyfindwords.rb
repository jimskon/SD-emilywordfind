# Read file and return at an array of lines
def getFileLines(name)
    fileObj = File.open(name)
    text = fileObj.read()
    text.split("\n")
end

# Display all the line in an array of text strings
def displayLines(lines)
    lines.each do |l|
      print l,"\n"
    end
end


def createWordLineTable(lines)
    table = {}
    lineNm = 0
    lines.each do |l|
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

def printMatchingLines(table,lines,word)
    prev = -1
    if table.key?(word)
        table[word].each do |index|
            if index!=prev
                print index,". ",lines[index],"\n"
            end
            prev = index
        end
    else
        print word, " Not found","\n"
    end  
end  

def lookupWords(table,lines)
    while true
        print "word to lookup:"
        w = gets.chomp
        if w.length<1
            break
        end
        printMatchingLines(table,lines,w)
    end 
end  

lines=getFileLines("emilydickenson.txt")

table=createWordLineTable(lines)
#print table,"\n"
print "total unique words:",table.length,"\n"
#displayTableAlpha(table)
lookupWords(table,lines)
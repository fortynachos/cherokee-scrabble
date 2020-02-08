require 'pp'

sylb_dictionary = Hash.new(0)
blacklist = [' ','.',',','?','/','\\','-',':',')','(','"','\'','&',';','!','–','“','”','‘','’','@','$', '…', 
	'%','—', '`', '•', '[', ']','‾', '^', '1','2','3','4','5','6','7','8','9','0', '_', '¬', 'ˌ', '·', '﹕',
	'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
	'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

Dir.foreach('/Users/mikefotinatos/Projects/cherokee-scrabble/corpus/') do |filename|
  next if filename == '.' or filename == '..'
  
  file = File.open("./corpus/#{filename}")
  lines = file.readlines.map(&:chomp)
  lines.each {
  	|line| line.each_char {
  		|char| unless blacklist.include?(char) 
  			sylb_dictionary[char] += 1
  		end
  	}
  }
end

pp sylb_dictionary
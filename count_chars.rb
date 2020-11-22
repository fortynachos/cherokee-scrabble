require 'pp'

sylb_dictionary = Hash.new(0)
exclude_list = [' ','.',',','?','/','\\','-',':',')','(','"','\'','&',';','!','–','“','”','‘','’','@','$', '…', 
	'%','—', '`', '•', '[', ']','‾', '^', '1','2','3','4','5','6','7','8','9','0', '_', '¬', 'ˌ', '·', '﹕',
	'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
	'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

allow_list = ["Ꮝ","Ꮧ","Ꭰ","Ꭲ","Ꮎ","Ꭹ","Ꮒ","Ꭴ","Ꮣ","Ꭿ","Ꭶ","Ꮅ","Ꮕ","Ꮄ","Ꮑ","Ꮫ","Ꮓ","Ꭼ","Ꭸ","Ꮩ","Ꮈ","Ꮢ","Ꭺ",
  "Ꮵ","Ᏻ","Ᏹ","Ꮃ","Ꮥ","Ꮪ","Ꮷ","Ꮹ","Ꮞ","Ꮻ","Ᏼ","Ꮤ","Ꮿ","Ꮆ","Ꮳ","Ꮙ","Ꮂ","Ꮔ","Ꮏ","Ꮺ","Ꮖ","Ᏸ","Ꮟ","Ꭵ","Ꭽ","Ᏺ",
  "Ꭱ","Ꮨ","Ꮴ","Ꮜ","Ꮲ","Ꭾ","Ꭳ","Ꮯ","Ꭷ","Ꮭ","Ꮸ","Ꮼ","Ꮠ","Ꮇ","Ꮀ","Ꮶ","Ꮘ","Ꮚ","Ꮁ","Ꮰ","Ꮡ","Ꮉ","Ꮦ","Ꮽ","Ꮋ","Ꭻ","Ꮗ",
  "Ꮮ","Ꮱ","Ꮬ","Ꮾ","Ꮊ","Ꮛ","Ꮌ","Ꮍ","Ꮐ"]

Dir.foreach('/Users/mikefotinatos/Projects/cherokee-scrabble/corpus/') do |filename|
  next if filename == '.' or filename == '..'
  
  file = File.open("./corpus/#{filename}")
  lines = file.readlines.map(&:chomp)
  lines.each {
  	|line| line.each_char {
  		|char| if allow_list.include?(char) 
  			sylb_dictionary[char] += 1
  		end
  	}
  }
end

pp sylb_dictionary
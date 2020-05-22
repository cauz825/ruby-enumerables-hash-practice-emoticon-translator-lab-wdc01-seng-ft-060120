# require modules here
require "yaml"
require 'pry'

def load_library(library)
  # code goes here
  emoticons_library = YAML.load_file(library)
  emoticons_library.each_with_object({}) do |(emoticon_name, emoticons), final_hash|
    emoticons.each do |english, japanese|
      final_hash[emoticon_name] = {:english => emoticons[0], :japanese => emoticons[1]}
    end
  end
end


def get_english_meaning(library, japanese_emoticon)
  # code goes here
  # input = "japanese_emoticon", output = emoticon_name
  english_meaning = " "
  library_hash = load_library(library)
  library_hash.each do |emoticon_name, emoticon_language|
    emoticon_language.each do |key, value|
      # binding.pry
      if value == japanese_emoticon
        english_meaning = library_hash[emoticon_name].to_s
        binding.pry
      else
        return "Sorry, that emoticon was not found"
    end
    end
  end
  english_meaning
end
  
  
def get_japanese_emoticon(library, english_emoticon)
  # code goes here
  # input "english_emoticon", output = "japanese_emoticon"
  # emoticon_language = 2 hashes: 1 for english, 1 for japanese 
  library_hash = load_library(library)
  library_hash.each do |emoticon_name, emoticon_language|
    if emoticon_language == [:english]
      library_hash[emoticon_name][emoticon_language][:japanese]
    else
      return "Sorry, that emoticon was not found"
    end
  end
end
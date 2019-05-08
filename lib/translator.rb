require "yaml"

def load_library(emoji_path)
  emoji_path = YAML.load_file('./lib/emoticons.yml')
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  emoji_path.each do |meaning, emoticons|
    result["get_meaning"][emoticons[1]] = meaning
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  result
end

def get_japanese_emoticon(emoji_path, english_emote)
  # code goes here
  library = load_library(emoji_path)
  if library["get_emoticon"].include?(english_emote)
    library["get_emoticon"][english_emote]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(emoji_path, japanese_emote)
  # code goes here
  library = load_library(emoji_path)
  if library["get_meaning"].include?(japanese_emote)
    library["get_meaning"][japanese_emote]
  else
    "Sorry, that emoticon was not found"
  end
end
# Search the given word for substrings present in the dictionary array, and
# count how many times each substring appeared (if it appeared at least once)
# @param word [String] the string to be searched in
# @param dictionary [Array<String>] list of substring to search for
# A test description
# @return [Hash{String => Integer}] containing the found substrings along with
#   their count
def word_substrings(word, dictionary)
  # perform case-insensitive matching
  dictionary = dictionary.map {|entry| entry.downcase }
  word = word.downcase

  dictionary.reduce(Hash.new) do |substring_count, entry|
    # try doing this algorithmically
    if word.include?(entry)
      substring_count[entry] = word.scan(/#{entry}/).length
    end
    substring_count
  end
end

# Search the given string for substrings present in the dictionary array, and
# count how many times each substring appeared (if it appeared at least once)
# @param string [String] the string to be searched in
# @param dictionary [Array<String>] list of substring to search for
# @return [Hash{String => Integer}] containing the found substrings along with
#   their count
def substrings(string, dictionary)
  string.split(" ").reduce(Hash.new(0)) do |substring_count, word|
    word_substring_count = word_substrings(word, dictionary)

    word_substring_count.each do |entry, count|
      substring_count[entry] += count
    end

    substring_count
  end
end

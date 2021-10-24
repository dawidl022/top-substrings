require_relative "../lib/substrings.rb"

describe "substrings" do

  describe "#substrings" do
    dictionary = [
      "below", "down", "go", "going", "horn", "how", "howdy", "it", "i",
      "low", "own", "part", "partner", "sit"
    ]

    it "returns substrings count of a single word given a dictionary" do
      input = "below"
      expected = { "below" => 1, "low" => 1 }
      expect(substrings(input, dictionary)).to eql(expected)
    end

    it "returns substring count of multiple words given a dictionary" do
      input = "Howdy partner, sit down! How's it going?"
      expected = {
        "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1,
        "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1
      }
      expect(substrings(input, dictionary)).to eql(expected)
    end

    it "returns an empty hash if no substrings were found" do
      input = "Gbbersh"
      expected = {}
      expect(substrings(input, dictionary)).to eql(expected)
    end
  end

  describe "#word_substrings" do
    dictionary = [
      "below", "down", "go", "going", "horn", "how", "howdy", "it", "i",
      "low", "own", "part", "partner", "sit"
    ]

    it "returns substrings count of a single word given a dictionary" do
      input = "below"
      expected = { "below" => 1, "low" => 1 }
      expect(word_substrings(input, dictionary)).to eql(expected)
    end

    it "returns substrings count of another word given a dictionary" do
      input = "partition"
      expected = { "part" => 1, "it" => 1, "i" => 2 }
      expect(word_substrings(input, dictionary)).to eql(expected)
    end

    it "returns substrings count even when case doesn't match" do
      input = "PARTITION"
      expected = { "part" => 1, "it" => 1, "i" => 2 }
      expect(word_substrings(input, dictionary)).to eql(expected)
    end
  end

end

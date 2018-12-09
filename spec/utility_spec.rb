require "utility"
require 'facets'

describe Utility do
  describe "#levenshtein" do
    it "compares two strings" do
      puts Utility.levenshtein(first: "megsdlpulxvinkatfjoyzxcbvq", second: "megsdlpulxvinkatfvoyzxcbvq")
      puts "megsdlpulxvinkatfjoyzxcbvq".edit_distance("megsdlpulxvinkatfvoyzxcbvq")
    end
  end
end
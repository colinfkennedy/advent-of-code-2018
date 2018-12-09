require "day_two"

describe DayTwo do
  describe "#find_checksum" do
    context "with box numbers with one 2 letter occurence and no 3 letter occurrence" do
      it "returns 0" do
        expect(DayTwo.find_checksum(input: ["aa"])).to eq(0)
      end
    end

    context "with box numbers with no 2 letter occurence and one 3 letter occurrence" do
      it "returns 0" do
        expect(DayTwo.find_checksum(input: ["aaa"])).to eq(0)
      end
    end

    context "with box numbers with one 2 letter occurence and one 3 letter occurrence" do
      it "returns 1" do
        expect(DayTwo.find_checksum(input: ["aabbb"])).to eq(1)
      end
    end

    context "with box numbers with two 2 letter occurences and one 3 letter occurrence" do
      it "returns 2" do
        expect(DayTwo.find_checksum(input: ["aabbb", "aa"])).to eq(2)
      end
    end

    context "with box numbers with two 2 letter occurences and two 3 letter occurrence" do
      it "returns 2" do
        expect(DayTwo.find_checksum(input: ["aabbb", "aalll"])).to eq(4)
      end
    end

    context "with test box numbers" do
      it "returns 12" do
        expect(DayTwo.find_checksum(input: ["abcdef", "bababc", "abbcde", "abcccd", "aabcdd", "abcdee", "ababab"])).to eq(12)
      end
    end
  end

  describe "#find_common_box_id" do
    context "with test input" do
      it "returns the common box id" do
        expect(DayTwo.find_common_box_id(input: ["abcde", "fghif", "klmno", "pqrst", "fguif", "axcye", "wvxyz"])).to eq("fgif")
      end
    end
  end
end

class Utility
  def self.levenshtein(first:, second:)
    m = first.length
    n = second.length
    return m if n.zero?
    return n if m.zero?

    # Create our distance matrix
    d = Array.new(m + 1) {Array.new(n + 1)}
    0.upto(m) { |i| d[i][0] = i }
    0.upto(n) { |j| d[0][j] = j }

    1.upto(n) do |j|
      1.upto(m) do |i|
        d[i][j] = first[i - 1] == second[j - 1] ? d[i - 1][j - 1] : [d[i - 1][j] + 1,d[i][j - 1] + 1,d[i - 1][j - 1] + 1,].min
      end
    end
    d[m][n]
  end
end
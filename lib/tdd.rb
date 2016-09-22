class Array

  def my_uniq
    results = []
    self.each do |el|
      results << el unless results.include?(el)
    end
    results
  end

  def two_sum
    results = []

    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        results << [i, j] if self[i] + self[j] == 0
        j += 1
      end
      i += 1
    end

    results
  end

  def my_transpose
    new_arr = Array.new(length) { Array.new(length)}
    self.each_with_index do |el, i|
      el.each_with_index do |item, j|
        new_arr[j][i] = item
      end
    end
    new_arr
  end



end

def stock_picker(prices)
  max_indexes = [0, 1]
  max_diff = prices[1] - prices[0]

  prices.each_with_index do |el, start_idx|
    (start_idx+1...prices.length).each do |end_idx|
      diff = prices[end_idx] - prices[start_idx]
      if diff > max_diff
        max_indexes = [start_idx, end_idx]
        max_diff = diff
      end
    end
  end

  max_indexes
end


class TowersOfHanoi
  attr_reader :stacks

  def initialize(num = 3)
    @stacks = [(1..num).to_a.reverse, [], []]
  end

  def move(start_pos, end_pos)
    if !stacks[end_pos].empty? && stacks[start_pos].last > stacks[end_pos].last
      raise "Cannot move on a smaller disk"
    end

    if stacks[start_pos].empty?
      raise "Cannot move from an empty stack"
    end

    piece = stacks[start_pos].pop
    stacks[end_pos] << piece
  end

  def won?
    if stacks[0].empty? && (stacks[1].empty? || stacks[2].empty?)
      true
    else
      false
    end
  end
end

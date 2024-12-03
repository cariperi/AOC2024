# puzzle input is memory
# mul(x, y) where x and y are 1-3 digit numbers
# ignore invalid inputs
# sum the results of all valid mul operators
class Day3
  attr_reader :memory
  REGEX = /mul\((\d{1,3}),(\d{1,3})\)/

  def initialize
    @memory = get_input
  end

  def sum_of_valid_muls
    find_valid_muls.map { |x, y| x * y }.reduce(:+)
  end

  private

  def get_input
    File.read('input.txt')
  end

  def find_valid_muls
    memory.scan(REGEX).map { |x, y| [x.to_i, y.to_i] }
  end
end

pp Day3.new.sum_of_valid_muls

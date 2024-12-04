# puzzle input is memory
# mul(x, y) where x and y are 1-3 digit numbers
# ignore invalid inputs
# sum the results of all valid mul operators

# The do() instruction enables future mul instructions.
# The don't() instruction disables future mul instructions.

class Day3
  attr_reader :memory
  REGEX = /mul\((\d{1,3}),(\d{1,3})\)/

  def initialize
    @memory = get_input
  end

  def sum_of_valid_muls
    find_valid_muls.map { |x, y| x * y }.reduce(:+)
  end

  def sum_of_valid_enabled_muls
    operations = find_valid_muls_and_commands
    result = handle_instructions(operations)
    result.map { |x, y| x.to_i * y.to_i }.reduce(:+)
  end

  private

  def get_input
    File.read('input.txt')
  end

  def find_valid_muls
    memory.scan(REGEX).map { |x, y| [x.to_i, y.to_i] }
  end

  def find_valid_muls_and_commands
    memory.scan(/(mul\((\d{1,3}),(\d{1,3})\))|(do\(\))|(don't\(\))/).map(&:compact)
  end

  def handle_instructions(list)
    enabled = true
    enabled_only = []
    list.each do |instruction|
      if instruction.first.include?("mul") && enabled
        enabled_only << instruction[1..2]
      elsif instruction.first.include?("don't")
        enabled = false
      elsif instruction.first.include?("do")
        enabled = true
      end
    end
    enabled_only
  end
end

pp Day3.new.sum_of_valid_muls
pp Day3.new.sum_of_valid_enabled_muls

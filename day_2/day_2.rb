# reports - 1 per line
# levels - numbers separated by spaces
# safe is:
# all increasing or decreasing
# adjacent levels differ by at least 1
# adjacent levels differ by at most 3

class Day2
  attr_reader :reports

  def initialize
    @reports = get_input
  end

  def number_of_safe_reports
    safe_reports = 0
    reports.each do |report|
      safe_reports +=1 if is_safe?(report)
    end
    safe_reports
  end

  def number_of_safe_reports_with_dampener
    safe_reports = 0
    reports.each do |report|
      if is_safe?(report)
        safe_reports +=1
      elsif is_safe_with_dampener?(report)
        safe_reports += 1
      end
    end
    safe_reports
  end

  private

  def get_input
    file = File.open('input.txt')
    file.readlines.map { |line| line.strip.split.map(&:to_i) }
  end

  def is_safe_with_dampener?(report)
    levels_count = report.count
     i = 0
     safe = false
     while i < levels_count do
      dampened_report = report.dup.tap{|r| r.delete_at(i)}
      safe = is_safe?(dampened_report)
      break if safe
      i += 1
     end
    safe
  end

  def is_safe?(report)
    (all_increasing?(report) || all_decreasing?(report)) && differences_meet_criteria?(report)
  end

  def all_increasing?(report)
    report.each_cons(2).all? { |x, y| y > x }
  end

  def all_decreasing?(report)
    report.each_cons(2).all? { |x, y| y < x }
  end

  def differences_meet_criteria?(report)
    report.each_cons(2).all? do |x, y|
      difference = (x - y).abs
      1 <= difference && difference <= 3
    end
  end
end

puts Day2.new.number_of_safe_reports
puts Day2.new.number_of_safe_reports_with_dampener

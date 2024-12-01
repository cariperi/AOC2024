list_1 = []
list_2 = []
scores = []

file = File.open('input_1.txt')
file.readlines.each do |line|
  values = line.strip.split(" ")
  list_1 << values[0].to_i
  list_2 << values[1].to_i
end

list_1.each do |value|
  scores << (list_2.count(value) * value)
end

puts scores.sum
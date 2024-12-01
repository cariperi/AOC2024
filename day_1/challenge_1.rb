# To find out, pair up the numbers and measure how far apart they are.
# Pair up the smallest number in the left list with the smallest number in the right list,
# then the second-smallest left number with the second-smallest right number, and so on.

# Within each pair, figure out how far apart the two numbers are;
# you'll need to add up all of those distances.
# For example, if you pair up a 3 from the left list with a 7 from the right list,
# the distance apart is 4; if you pair up a 9 with a 3, the distance apart is 6.

list_1 = []
list_2 = []
differences = []

file = File.open('input_1.txt')
file.readlines.each do |line|
  values = line.strip.split(" ")
  list_1 << values[0].to_i
  list_2 << values[1].to_i
end

sorted_list_1 = list_1.sort
sorted_list_2 = list_2.sort
i = 0

while i < sorted_list_1.count do
  differences << (sorted_list_1[i] - sorted_list_2[i]).abs
  i += 1
end

pp differences.sum

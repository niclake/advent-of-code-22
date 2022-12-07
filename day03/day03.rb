# Given a list of contents
# Each content contains 2 sets of items
# Every item type can be converted to priority
# a..z == 1..26
# A..Z == 27..52
# The intersection would = the priority
# Find the sum of the priorities of the item types
def intersect_value(first, second, third = nil)
  # When creating priority_value, using & at the start to push the string length by one
  # so that when fetching it, I don't have to +1
  priorities = [*'a'..'z', *'A'..'Z']

  if !third.nil?
    intersect = first.split('') & second.split('') & third.split('')
  else
    intersect = first.split('') & second.split('')
  end

  priorities.index(intersect[0]) + 1
end

total_priorities = 0

File.foreach("day03input.txt") do |line|
  first, second = line.chars.each_slice(line.length / 2).map(&:join)

  total_priorities += intersect_value(first, second)
end

puts total_priorities

# Part 1 answer: 7863
#
# Each group of 3 lines corresponds to a group of elves
# Find the intersection of these groups, find the value, and sum the priorities of these

elf_priorities = 0

File.foreach("day03input.txt").each_slice(3) do |lines|
  elf_priorities += intersect_value(lines[0], lines[1], lines[2])
end

puts elf_priorities

# Part 2 answer: 2488
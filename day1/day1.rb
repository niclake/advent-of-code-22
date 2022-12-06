# Find the Elf carrying the most calories. How many calories are they carrying?

elf_calories = []
calories = 0

File.foreach("day1input.txt") do |line|
  if line.to_i == 0
    elf_calories << calories
    calories = 0
  else
    calories += line.to_i
  end
end

puts elf_calories.max

# Answer: 71300

# What is the total value of calories carried by the top 3 elves?

puts elf_calories.max(3).sum

# Answer: 209691
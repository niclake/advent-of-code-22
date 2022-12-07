overlap_counter = 0

File.foreach("day04input.txt") do |line|
  assignments = line.split(',')

  elf_one = assignments[0].split('-').map(&:to_i)
  elf_two = assignments[1].split('-').map(&:to_i)


  if elf_one[0] >= elf_two[0] && elf_one[1] <= elf_two[1]
    overlap_counter += 1
  elsif elf_two[0] >= elf_one[0] && elf_two[1] <= elf_one[1]
    overlap_counter += 1
  end
end

puts overlap_counter

# Part one answer: 490

any_overlap_counter = 0

File.foreach("day04input.txt") do |line|
  assignments = line.split(',')

  elf_one = assignments[0].split('-').map(&:to_i)
  elf_two = assignments[1].split('-').map(&:to_i)

  any_overlap_counter += 1 if
    elf_one[0].between?(elf_two[0],elf_two[1]) ||
      elf_one[1].between?(elf_two[0],elf_two[1]) ||
      elf_two[0].between?(elf_one[0],elf_one[1]) ||
      elf_two[1].between?(elf_one[0],elf_one[1])
end

puts any_overlap_counter

# Part two answer: 921
File.foreach("day06input.txt") do |line|
  line.chars.each_with_index do |_char, index|
    next if index < 13

    check_this = line[index-13..index]
    if check_this.chars.uniq.count == check_this.length
      p "#{check_this} at position #{index + 1}"
      break
    end
  end
end

# Part one answer: 1909
# Part two answer: 3380
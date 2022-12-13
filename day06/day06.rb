File.foreach("day06input.txt") do |line|
  line.chars.each.with_index(1) do |_char, index|
    req_length = 14 # was 4
    next if index < req_length

    check_this = line[index-req_length..index]
    if check_this.chars.uniq.count == req_length
      p "#{check_this} at position #{index}"
      break
    end
  end
end

# Part one answer: 1909
# Part two answer: 3380
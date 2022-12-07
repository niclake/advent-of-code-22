stacks = Array.new(10){ [] }
value = ""

File.foreach("day05input.txt") do |line|
  if line.include? "["
    line.chars.each_slice(4).map(&:join).each.with_index(1) do |item,item_index|
      if item.include? "["
        stacks[item_index].unshift(item[1])
      end
    end
  end

  if line.start_with?("move")
    values = line.gsub('move ', '').gsub(' from ',',').gsub(' to ',',').gsub("\n",'').split(',')
    qty = values[0].to_i
    source = values[1].to_i
    destination = values[2].to_i

    # stacks[destination].push stacks[source].last(qty).reverse()
    stacks[destination].push stacks[source].last(qty)
    stacks[destination] = stacks[destination].flatten
    stacks[source].pop(qty)
  end
end

stacks.each do |stack|
  next if stack.nil? || !stack.any?
  value += stack.last
end

p value.strip

# Part one answer: JCMHLVGMG
#
# To get part 2, remove the .reverse() from line 19
#
# Part two answer: LVMRWSSPZ
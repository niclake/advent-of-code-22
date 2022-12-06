# Rock Paper Scissors
# Input is a strategy guide
# A & X = Rock
# B & Y = Paper
# C & Z = Scissors
#
# ABC = opponent's play
# XYZ = my play
#
# I get fixed points depending on what I play
# Rock = 1
# Paper = 2
# Scissors = 3
#
# I get points based on win/loss/tie
# Win = 6
# Tie = 3
# Loss = 0

opponent_plays = {
  rock: "A",
  paper: "B",
  scissors: "C"
}
my_plays = {
  rock: "X",
  paper: "Y",
  scissors: "Z"
}

def calculate_score(my_play, opponent_play)
  thrown_points = {
    rock: 1,
    paper: 2,
    scissors: 3
  }

  outcome_points = {
    win: 6,
    draw: 3,
    loss: 0
  }

  # This having to be parked in here sucks
  # Is there a way to make this a global hash?
  beats = {
    rock: :paper,
    paper: :scissors,
    scissors: :rock
  }

  thrown_points[my_play] +
    if opponent_play == my_play
      outcome_points[:draw]
    else
      beats[opponent_play] == my_play ?
        outcome_points[:win] :
        outcome_points[:loss]
    end
end

total_score = 0

File.foreach("day02input.txt") do |line|
  opponent_play = opponent_plays.key(line[0])
  my_play = my_plays.key(line[2])

  total_score += calculate_score(my_play, opponent_play)
end

puts total_score

# Part 1 answer: 13484

# Now the 2nd input is the desired outcome, not what I should play
desired_outcome = {
  loss: "X",
  draw: "Y",
  win: "Z"
}

beats = {
  rock: :paper,
  paper: :scissors,
  scissors: :rock
}

total_score = 0

File.foreach("day02input.txt") do |line|
  opponent_play = opponent_plays.key(line[0])
  my_outcome = desired_outcome.key(line[2])
  my_play =
    case my_outcome.to_s
    when "draw"
      opponent_play
    when "win"
      beats[opponent_play]
    when "loss"
      beats.key(opponent_play)
    else
      nil
    end

  total_score += calculate_score(my_play, opponent_play)
end

puts total_score

# Answer: 13433
#  attr_asseccor 
@player_one_lives = 3
@player_two_lives = 3

@player_one_score = 3
@player_two_score = 3


def change_player
  if @player_turn  == 1
    @player_turn = 2
  else
    @player_turn = 1
  end 
end

def current_player
  if @player_turn == 1
    "Player 1"
  else
    "Player 2"
  end
end

def generate_question
  @first_number = rand(20)
  @second_number = rand(20)
end

def prompt_player_for_answer
  puts "#{current_player} what is #{@first_number} + #{@second_number}"
  @user_answer = gets.chomp.to_i
end

def subtract_lives
  if @player_turn == 1
    @player_one_lives -= 1
  else
    @player_two_lives -= 1
  end
end

def score_point
  if @player_turn == 1
    @player_one_score += 1
  else
    @player_two_score += 1
  end
end

def subtract_point
  if @player_turn == 1
    @player_one_score -= 1
  else
    @player_two_score -= 1
  end
end

def verify_answer
  if @user_answer == @first_number + @second_number
    puts 'Nice work!' 
    score_point
  else
    puts ' Wrong answer'
    subtract_lives
    subtract_point
  end
end

def in_play?
  (@player_one_lives > 0) && (@player_two_lives > 0)
end


# if number odd player 1
# number even player 2


def math_game_start
  @player_turn = 1
  while in_play?
    generate_question
    prompt_player_for_answer
    verify_answer
    break if in_play? == false
    change_player
  end
  puts "Player 1 Score: #{@player_one_score} \nPlayer 2 Score: #{@player_two_score}"
end

math_game_start
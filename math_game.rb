# if number odd player 1
# number even player 2

@player_one_lives = 3
@player_two_lives = 3

def change_player
  if @player_turn  == 1
    @player_turn = 2
  else
    @player_turn = 1
  end 
end

# @player = ""

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

def verify_answer
  if @user_answer == @first_number + @second_number
    puts 'Nice work!' 
  else
    puts ' Wrong answer'
    if @player_turn == 1
      @player_one_lives -= 1
    else
      @player_two_lives -= 1
    end
  end
end

def in_play?
  (@player_one_lives > 0) && (@player_two_lives > 0)
end


def math_game_start
  @player_turn = 1
  while in_play?
    generate_question
    prompt_player_for_answer
    verify_answer
    break if in_play? == false
    change_player
  end
end

math_game_start

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(position)
  position.to_i - 1
end

def move(board, position, char = "X")
  board[input_to_index(position)] = char
end

def position_taken?(board, position)
  board[position] == "X" || board[position] == "O"
end

def valid_move?(board, position)
  idx = input_to_index(position)
  idx.between?(0,8) && !position_taken?(board, idx)
end

def turn(board)
  puts "Please select a position between 1-9"
  input = gets.strip

  if !(valid_move?(board, input))
    turn(board)
  end

  move(board, input, current_player(board))
  display_board(board)
end

def turn_count(board)
  board.select{ |idx| idx == "X" || idx == "O" }.size
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    win_combo.all? { |index| board[index] == "X" } ||
    win_combo.all? { |index| board[index] == "O" }
  end
end  

def full?(board)
  !board.any? { |index| index == " " || index == "" || index == nil }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  !!won?(board) || full?(board)
end

def winner(board)
  won = won?(board)
  board[won[0]] if won.class == Array
end

def play(board)
  until over?(board) || draw?(board)
    turn(board)
  end

  #if (draw?(board))
  #  puts "Cats game!"
  #end

  puts winner(board) ? "Congratulations #{winner(board)}!" : "Cats Game!"
end






































# Helper Method
require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.find do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  board.each_with_index do |slot, index|
    #binding.pry#!(board[index].nil? || board[index] == " ")
    if !(position_taken?(board,index))
      return false
    end
  end
end

def draw?(board)
  #board.each do |slot|
    #binding.pry
  if full?(board) && !(won?(board))
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)

  if combo = won?(board)
    #binding.pry
    board[combo[0]]
  end
end


class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [6, 4, 2],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]       ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input = input.to_i
    @index = input - 1
    @index
  end
  
  def move(index, token = "X")
    index = index.to_i
    @board[index] = token
  end
  
  def position_taken?(index)
    index = index.to_i
    position_value = @board[index]
    if !(position_value == "X" || position_value == "O")
      false
    elsif position_value == "X" || position_value == "O"
      true
    end
  end
  
  def valid_move?(position)
    position = position.to_i
    if position.between?(0,9)
     !(position_taken?(position))
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |i|
      if i == "X" || i == "O"
        counter += 1
      end
    end
    counter
  end
  
  def current_player
    number_of_plays = turn_count
    if number_of_plays % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def turn
    input = gets.chomp
    input_to_index(input)
    if valid_move?(@index)
      move(@index, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      
      index_1 = win_combo[0]
      index_2 = win_combo[1]
      index_3 = win_combo[2]
      
      position_1 = @board[index_1]
      position_2 = @board[index_2]
      position_3 = @board[index_3]
      
      (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    end
  end
  
  def full?
    @board.all? {|marker| marker == "X" || marker == "O"}
  end
  
  def draw?
    if full? && !(won?)
      true
    else
      false
    end
  end
  
  def over?
    if won? || draw?
      true
    else
      false
    end
  end
  
  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end
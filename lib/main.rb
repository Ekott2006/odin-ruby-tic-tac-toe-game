require_relative 'tic_tac_toe_game'
O = "O"
X = "X"
tic_tac_toe_game = TicTacToeGame.new

puts "Tic-Tac-Toe Game on the command line"

# Get Player 2 Input if he will be X or O
print "Player 1, choose X or O (default is X): "
user1_input = gets.chomp == O ? O : X
user2_input = user1_input == O ? X : O
puts "Player 1 is #{user1_input} and Player 2 is #{user2_input}"

# Print the game format
tic_tac_toe_game.print_board

# Get Player 1 and Player 2 Input of location to place his X or O
loop do
  players = [{ name: "Player 1", input: user1_input }, { name: "Player 2", input: user2_input }]

  players.each do |player|
    loop do
      print "#{player[:name]}, enter your move (row): "
      row = gets.chomp.to_i
      print "#{player[:name]}, enter your move (column): "
      column = gets.chomp.to_i

      input_correct = tic_tac_toe_game.add_user_input?(row, column, player[:input])
      tic_tac_toe_game.print_board
      if input_correct
        break
      end
      puts "Invalid input. Please enter a number between 1 and 3. Try again!!!"
    end

    # Check for winner
    if tic_tac_toe_game.check_for_winner == player[:input]
      puts "#{player[:name]} Wins!!!!"
      exit
    end
    # Exit if its draw
    if tic_tac_toe_game.is_end?
      puts "DRAW"
      exit
    end
  end

end

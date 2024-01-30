# frozen_string_literal: true

class TicTacToeGame
  attr_accessor :current_game

  def initialize
    @current_game = Array.new(3) { Array.new(3, nil) }
  end

  def add_user_input?(row_num, column_num, char)
    if row_num.between?(1, 3) and column_num.between?(1, 3) and @current_game[row_num - 1][column_num - 1] == nil
      @current_game[row_num - 1][column_num - 1] = char
      true
    else
      false
    end
  end

  def check_for_winner
    result = Array.new(2) { Hash.new(0) } # [0] is for the first, [1] is for the second user
    @current_game.each_with_index do |row, i|

      # Diagonal Left
      result[0]["diagonal-left"] += 1 if current_game[i][i] == "X"
      result[1]["diagonal-left"] += 1 if current_game[i][i] == "O"

      row.each_with_index do |cell, j|
        # Left to Right
        result[0]["left-to-right#{i}"] += 1 if cell == "X"
        result[1]["left-to-right#{i}"] += 1 if cell == "O"

        # Up to Down
        result[0]["up-to-down#{i}"] += 1 if current_game[j][i] == "X"
        result[1]["up-to-down#{i}"] += 1 if current_game[j][i] == "O"

        # Diagonal Right
        if (i == 0 and j == 2) or (i == 1 and j == 1) or (i == 2 and j == 0)
          result[0]["diagonal-right"] += 1 if cell == "X"
          result[1]["diagonal-right"] += 1 if cell == "O"
        end
      end
    end

    return "X" if result[0].values.max == 3
    return "O" if result[1].values.max == 3
    nil
  end

  def is_end?
    @current_game.all? { |row| row.none?(&:nil?) } # ChapGPT method
  end

  def print_board
    puts "|     |  1  |  2  |  3  |"
    puts "+------------------------"
    @current_game.each_with_index do |row, i|
      print_row = "|  #{i + 1}  |"
      row.each { |cell| print_row += "  #{cell == nil ? " " : cell}  |" }
      puts print_row
      puts "+------------------------"
    end
  end

end


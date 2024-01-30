# frozen_string_literal: true

class TicTacToeGameSpecHelper
  def self.test_no_winner_game_one
    [
      [nil, nil, nil],
      ['X', 'X', 'O'],
      [nil, nil, nil]
    ]
  end

  def self.test_no_winner_game_two
    [
      [nil, nil, 'X'],
      ['X', 'X', 'O'],
      [nil, nil, nil]
    ]
  end

  def self.test_no_winner_game_three
    [
      [nil, nil, nil],
      [nil, 'X', 'O'],
      [nil, 'X', nil]
    ]
  end

  def self.test_no_winner_game_four
    [
      ['X', 'X', nil],
      ['X', 'X', 'O'],
      [nil, nil, nil]
    ]
  end

  def self.test_winner_row_one_special
    [
      ['A', 'A', 'A'],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  end

  def self.test_winner_row_one
    [
      ['X', 'X', 'X'],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  end

  def self.test_winner_row_two
    [
      [nil, nil, nil],
      ['X', 'X', 'X'],
      [nil, nil, nil]
    ]
  end

  def self.test_winner_row_three
    [
      [nil, nil, nil],
      [nil, nil, nil],
      ['O', 'O', 'O']
    ]
  end

  def self.test_winner_col_one
    [
      ['O', nil, nil],
      ['O', nil, nil],
      ['O', nil, nil]
    ]
  end

  def self.test_winner_col_two
    [
      [nil, 'O', nil],
      [nil, 'O', nil],
      [nil, 'O', nil]
    ]
  end

  def self.test_winner_col_three
    [
      [nil, nil, 'X'],
      [nil, nil, 'X'],
      [nil, nil, 'X']
    ]
  end

  def self.test_winner_diagonal_right
    [
      ['X', nil, nil],
      [nil, 'X', nil],
      [nil, nil, 'X']
    ]
  end

  def self.test_winner_diagonal_left
    [
      [nil, nil, 'O'],
      [nil, 'O', nil],
      ['O', nil, nil]
    ]
  end

  def self.test_game_end
    [
      ['X', 'X', 'O'],
      ['X', 'X', 'O'],
      ['O', 'O', 'X']
    ]
  end

end

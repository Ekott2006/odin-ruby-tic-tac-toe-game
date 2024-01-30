# frozen_string_literal: true

require 'rspec'
require_relative '../lib/tic_tac_toe_game'
require_relative 'tic_tac_toe_game_spec_helper'

describe TicTacToeGame do
  subject(:game) { described_class.new }

  context '#initialize' do
    it 'height of 3' do
      expect(game.current_game.length).to eql(3)
    end
    it 'width of 3' do
      expect(game.current_game.all? { |sub_array| sub_array.length == 3 }).to be true
    end
  end

  context '#add_user_input' do
    it "return false and don't change if row and column is less than 1" do
      expect { game.add_user_input?(0, 0, 'X') }.not_to change { game.current_game } and be false
    end

    it "return false and don't change if row and column is more than 3" do
      expect { game.add_user_input?(4, 4, 'X') }.not_to change { game.current_game } and be false
    end

    it "return false and don't change if row is less than 1" do
      expect { game.add_user_input?(0, 3, 'X') }.not_to change { game.current_game } and be false
    end

    it "return false and don't change if row is more than 3" do
      expect { game.add_user_input?(4, 3, 'X') }.not_to change { game.current_game } and be false
    end

    it "return false and don't change if column is less than 1" do
      expect { game.add_user_input?(3, 0, 'X') }.not_to change { game.current_game } and be false
    end

    it "return false and don't change if column is more than 3" do
      expect { game.add_user_input?(3, 4, 'X') }.not_to change { game.current_game } and be false
    end

    it "return true and change if row and column is between 1 and 3" do
      i = 3
      char = 'X'
      expect { game.add_user_input?(i, i, char) }.to change { game.current_game[i - 1][i -1] }.to(char) and be true
    end

    it "return false and don't change the second time when called twice" do
      i = 3
      char = 'X'
      game.add_user_input?(i, i, char)
      expect { game.add_user_input?(i, i, char) }.not_to change { game.current_game } and be false
    end
  end

  context '#check_for_winner' do
    it 'returns X' do
      game.current_game = TicTacToeGameSpecHelper.test_winner_row_one
      expect(game.check_for_winner).to eql('X')
    end

    it 'returns O' do
      game.current_game = TicTacToeGameSpecHelper.test_winner_row_three
      expect(game.check_for_winner).to eql('O')
    end

    it 'returns nil for invalid character' do
      game.current_game = TicTacToeGameSpecHelper.test_winner_row_one_special
      expect(game.check_for_winner).to be_nil
    end

    context 'returns nil' do
      it 'empty array' do
        expect(game.check_for_winner).to eql(nil)
      end

      it "no winner game 1" do
        game.current_game = TicTacToeGameSpecHelper.test_no_winner_game_one
        expect(game.check_for_winner).to eql(nil)
      end

      it "no winner game 2" do
        game.current_game = TicTacToeGameSpecHelper.test_no_winner_game_two
        expect(game.check_for_winner).to eql(nil)
      end

      it "no winner game 3" do
        game.current_game = TicTacToeGameSpecHelper.test_no_winner_game_three
        expect(game.check_for_winner).to eql(nil)
      end

      it "no winner game 4" do
        game.current_game = TicTacToeGameSpecHelper.test_no_winner_game_four
        expect(game.check_for_winner).to eql(nil)
      end
    end

    context 'returns winner' do

      it "row 1" do
        game.current_game = TicTacToeGameSpecHelper.test_winner_row_one
        expect(game.check_for_winner).not_to eql(nil)
      end

      it "row 2" do
        game.current_game = TicTacToeGameSpecHelper.test_winner_row_two
        expect(game.check_for_winner).not_to eql(nil)
      end

      it "row 3" do
        game.current_game = TicTacToeGameSpecHelper.test_winner_row_three
        expect(game.check_for_winner).not_to eql(nil)
      end

      it "column 1" do
        game.current_game = TicTacToeGameSpecHelper.test_winner_col_one
        expect(game.check_for_winner).not_to eql(nil)
      end

      it "column 2" do
        game.current_game = TicTacToeGameSpecHelper.test_winner_col_two
        expect(game.check_for_winner).not_to eql(nil)
      end

      it "column 3" do
        game.current_game = TicTacToeGameSpecHelper.test_winner_col_three
        expect(game.check_for_winner).not_to eql(nil)
      end

      it 'diagonal right' do
        game.current_game = TicTacToeGameSpecHelper.test_winner_diagonal_right
        expect(game.check_for_winner).not_to eql(nil)
      end

      it 'diagonal left' do
        game.current_game = TicTacToeGameSpecHelper.test_winner_diagonal_left
        expect(game.check_for_winner).not_to eql(nil)
      end

    end
  end

  context '#is_end?' do
    it 'return false at the start' do
      expect(game).not_to be_is_end
    end
    it 'return false when not all cells have a value' do
      game.current_game = TicTacToeGameSpecHelper.test_no_winner_game_four
      expect(game).not_to be_is_end
    end
    it 'return false when only one column have value' do
      game.current_game = TicTacToeGameSpecHelper.test_winner_row_one
      expect(game).not_to be_is_end
    end
    it 'return true when all cells have a value' do
      game.current_game = TicTacToeGameSpecHelper.test_game_end
      expect(game).to be_is_end
    end
  end
end

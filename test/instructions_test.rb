require_relative 'test_helper'
require './lib/instructions'

class InstructionsTest < Minitest::Test

  def test_it_exists
    assert_instance_of Instructions, Instructions.new
  end

  def test_display_welcome_screen_takes_player_choice
    instructions = Instructions.new

    assert_equal 'p', display_welcome_screen
  end

  # def test_it_initializes_to_welcome_screen_selection
  # end
end

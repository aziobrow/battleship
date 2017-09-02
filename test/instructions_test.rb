require_relative 'test_helper'
require './lib/instructions'

class InstructionsTest < Minitest::Test

  def test_it_exists
    assert_instance_of Instructions, Instructions.new
  end

  def test_it_prints_welcome_screen
    instructions = Instructions.new
    instructions.welcome_screen
  end
end

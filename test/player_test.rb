# pry(main)> require './lib/player'
# # => true

# pry(main)> player = Player.new({name: "Luka Modric", position: "midfielder"})    
# # => #<Player:0x00007fd8273d21e0...>

# pry(main)> player.name
# # => "Luka Modric"

# pry(main)> player.position
# # => "midfielder"
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/player'

class PlayerTest < Minitest::Test

  def test_it_exists
    player = Player.new({name: "Luka Modric", position: "midfielder"})
    assert_instance_of Player, player
  end 
    
  def test_it_has_attributes
    player = Player.new({name: "Luka Modric", position: "midfielder"})
    assert_equal "Luka Modric", player.name
    assert_equal "midfielder", player.position
  end 

end
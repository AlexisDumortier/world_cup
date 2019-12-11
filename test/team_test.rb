# pry(main)> require './lib/team'
# # => true

# pry(main)> require './lib/player'
# # => true

# pry(main)> team = Team.new("France")    
# # => #<Team:0x00007fe0d0335d48...>

# pry(main)> team.country
# # => "France"

# pry(main)> team.eliminated?
# # => false

# pry(main)> team.eliminated = true

# pry(main)> team.eliminated?
# # => true

# pry(main)> team.players
# # => []

# pry(main)> mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
# # => #<Player:0x00007fe0d02bd280...>

# pry(main)> pogba = Player.new({name: "Paul Pogba", position: "midfielder"})    
# # => #<Player:0x00007fe0d0851138...>

# pry(main)> team.add_player(mbappe)

# pry(main)> team.add_player(pogba)    

# pry(main)> team.players
# # => [#<Player:0x00007fe0d02bd280...>, #<Player:0x00007fe0d0851138...>]

# pry(main)> team.players_by_position("midfielder")
# # => [#<Player:0x00007fe0d0851138...>]

# pry(main)> team.players_by_position("defender")

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/player'
require_relative '../lib/team'


class TeamTest < Minitest::Test

  def setup
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})    
  end

  def test_it_exists
    assert_instance_of Team, @team
  end

  def test_it_has_attributes
    assert_equal 'France', @team.country
    assert_equal false, @team.eliminated
  end

  def test_it_is_not_eliminated_by_default
    assert_equal false, @team.eliminated
  end

  def test_we_can_check_it_has_been_eliminated
    assert_equal false, @team.eliminated?
    @team.eliminated = true
    assert_equal true, @team.eliminated?
  end

  def test_it_is_initialized_with_an_empty_team
    assert_equal [], @team.players
  end

  def test_it_can_add_players
    assert_equal [], @team.players
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    assert_equal [@mbappe, @pogba], @team.players
  end

  def test_it_can_return_players_by_position
    @team.add_player(@mbappe)
    @team.add_player(@pogba)    
    assert_equal [@pogba], @team.players_by_position("midfielder")
    assert_equal [], @team.players_by_position("defender")
  end

end
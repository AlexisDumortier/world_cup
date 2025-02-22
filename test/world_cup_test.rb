# pry(main)> world_cup.active_players_by_position("midfielder")
# # => [#<Player:0x00007f936c035eb0...>, #<Player:0x00007f936a3595f8...>]

# pry(main)> croatia.eliminated = true    

# pry(main)> world_cup.active_players_by_position("midfielder")
# # => [#<Player:0x00007f936c035eb0...>]

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/player'
require_relative '../lib/team'
require_relative '../lib/world_cup'


class WorldCupTest < Minitest::Test

  def setup 
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})    
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})    
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia = Team.new("Croatia")    
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})    
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})    
    @croatia.add_player(@modric)   
    @croatia.add_player(@vida)    
    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  def test_it_exists
    assert_instance_of WorldCup, @world_cup
  end 

  
  def test_it_has_attributes
    assert_equal 2018, @world_cup.year
    assert_equal [@france, @croatia], @world_cup.teams
  end 

  def test_it_can_return_active_players_in_position
    assert_equal [@pogba, @modric], @world_cup.active_players_by_position("midfielder")
    @croatia.eliminated = true
    assert_equal [@pogba], @world_cup.active_players_by_position("midfielder")
  end

end
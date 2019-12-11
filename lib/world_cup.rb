class WorldCup

  attr_reader :year, :teams

  def initialize(year, teams)
     @year = year
     @teams = teams
  end 

  def active_players_by_position(position)
    list_players = []
    @teams.each do |team|
      if !team.eliminated?
        list_players << team.players_by_position(position)
      end
    end
    list_players.flatten
  end

  def all_players_by_position
    players_by_position = {}
    @teams.each do |team|
      team.players.each do |player|
        if players_by_position[player.position]
          players_by_position[player.position] << player
        else
          players_by_position[player.position] = [player]
        end
      end
    end
    players_by_position
  end

end
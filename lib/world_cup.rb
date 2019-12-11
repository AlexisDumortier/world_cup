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

end
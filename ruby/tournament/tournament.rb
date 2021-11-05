require "pry"

class Team
  attr_reader :name, :mp, :won, :draw_game, :loss, :points, :rscore

  def initialize(name)
    @name = name
    @mp = 0
    @won = 0
    @draw_game = 0
    @loss = 0
    @points = 0
    @rscore = 0
  end

  def fight
    @mp += 1
  end

  def rank
    binding.pry
    if @points == 0
      @rscore = @name
    else
      @rscore = (0.1 / @points).to_s[2,7] + @name
    end
  end

  def win
    fight
    @won += 1
    @points += 3
  end
  
  def lose
    fight
    @loss += 1
  end
  
  def draw
    fight
    @draw_game += 1
    @points += 1
  end  

end


class Match

  class << self
    def fight(team1, team2, result)
      if result == 'win'
        team1.win
        team2.lose
      elsif result == 'draw'
        team1.draw
        team2.draw
      elsif result == 'loss'
        team1.lose
        team2.win
      end
    end
  end
end


class Tournament

  class Table
    
    
    def initialize(teams)
      
      @header = ['Team', 'MP','W','D','L','P']
      @values = []
      teams = sort(teams)
      teams.each do |team|
        @values.push([team.name, team.mp, team.won, team.draw_game,team.loss, team.points])
      end
    end

    def sort(teams)
      teams.each do |team|
        team.rank
      end
      teams.sort{|a, b| a.rscore <=> b.rscore}
    end
    
    def output
      @separator = " | "
      output_text = ([@header[0].ljust(30)] + @header[1..-1].map{|v| v.rjust(2)}).join(@separator) + "\n"
      @values.each do |row|
        output_text += ([row[0].ljust(30)] + row[1..-1].map{|v| v.to_s.rjust(2)}).join(@separator) + "\n"
      end
      output_text
    end
  end

  class << self
    def entry(team_name)
      if @teams_name_list.include?(team_name)
        @teams[@teams_name_list.index(team_name)]
      else
        new_team = Team.new(team_name)
        @teams_name_list.push(team_name)
        @teams.push(new_team)
        new_team
      end
    end

    def tally(input)

      # 参加チームのリスト
      @teams = []
      @teams_name_list = []      
      
      # 試合結果を登録して出力
      matches_text = input.split("\n")
      matches_text.each do |match_text|
        game_detail = match_text.split(";")
        team1 = entry(game_detail[0])
        team2 = entry(game_detail[1])
        result = game_detail[2]
        Match.fight(team1, team2, result)
      end

      # 集計表テーブルを作成
      table = Table.new(@teams)
      table.output
    end
  end
end


# input = <<~INPUT
# Courageous Californians;Devastating Donkeys;win
# Allegoric Alaskans;Blithering Badgers;win
# Devastating Donkeys;Allegoric Alaskans;loss
# Courageous Californians;Blithering Badgers;win
# Blithering Badgers;Devastating Donkeys;draw
# Allegoric Alaskans;Courageous Californians;draw
# INPUT
# puts Tournament.tally(input)
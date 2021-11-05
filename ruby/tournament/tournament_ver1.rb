=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

class Tournament 
  
  class Team
    attr_accessor :name
    attr_accessor :score
    
    def initialize(name)
      @name = name
      @score = {
        matches_players: 0,
        won: 0,
        draw: 0,
        lost: 0,
        points: 0
      }
    end
    
    def battle(opponent, result)
      @score[:matches_players] += 1
      opponent.score[:matches_players] += 1
      
      if result == 'win'
        @score[:won] += 1
        @score[:points] += 3
        opponent.score[:lost] += 1
      elsif result == 'draw'
        @score[:draw] += 1
        @score[:points] += 1
        opponent.score[:draw] += 1
        opponent.score[:points] += 1
      else
        @score[:lost] += 1
        opponent.score[:won] += 1
        opponent.score[:points] += 3
      end
    end
    
  end
  
  class << self
    def entry(team_name, teams_list)
      # 初めて現れるチームだったら、インスタンスを作成し、リストに追加
      unless teams_list.keys.include?(team_name.to_sym)
        new_team_sym = team_name.to_sym
        new_team = Team.new(team_name)
        teams_list[new_team_sym] = new_team
      end
      return teams_list
    end
    
    def ranking(teams_list)
      ranking_list = []
      teams_list.each do |sym, team|
        ranking_list.push([sym, team.score[:points]])
      end
      sorted_ranking_list = ranking_list.sort{|a,b|
       if a[1] == b[1]
        a[0] <=> b[0]
       else 
        b[1] <=> a[1]
       end
      }
      return sorted_ranking_list
    end
    
    
    def output(teams_list)
      # チーム名を得点順に並び替え
      ranking_list = ranking(teams_list)
      output_text = "Team                           | MP |  W |  D |  L |  P\n"
      ranking_list.each do |team|
        team_sym = team[0]
        output_text += team_sym.to_s.ljust(31) + '|  ' + teams_list[team_sym].score.values.join(' |  ') + "\n"
      end
      output_text
    end
    
    def tally(input)
      teams_list = {}
      # 入力を改行で区切る
      input_list = input.split("\n")
      
      # 改行の数だけ実行
      input_list.each do |row|
        # ；で区切る
        row_list = row.split(';')
        owner_name = row_list[0]
        opponent_name = row_list[1]
        result = row_list[2]

        # チームを登録
        teams_list = entry(owner_name, teams_list)
        teams_list = entry(opponent_name, teams_list)

        # 勝敗を記録
        owner = teams_list[owner_name.to_sym]
        opponent = teams_list[opponent_name.to_sym]
        owner.battle(opponent, result)

      end
      output(teams_list)
    end
  end


end

input = <<~INPUT
      Courageous Californians;Devastating Donkeys;win
      Allegoric Alaskans;Blithering Badgers;win
      Devastating Donkeys;Allegoric Alaskans;loss
      Courageous Californians;Blithering Badgers;win
      Blithering Badgers;Devastating Donkeys;draw
      Allegoric Alaskans;Courageous Californians;draw
    INPUT
puts Tournament.tally(input)
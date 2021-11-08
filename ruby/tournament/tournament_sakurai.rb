class Tournament
  class << self
    def tally(input)
      results = InputParser.call(input)
      teams = TeamRepository.new
      results.map { |result| teams.find_or_initialize(result[:team_name], result[:match_result]) }
      Formatter.call(teams.sort_by_point_and_name)
    end
  end
  class Formatter
    class << self
      def call(teams)
        teams.each_with_object(header) do |team, string|
          team_name = team.name.ljust(31)
          result = "|  #{team.matches_count} |  #{team.win_count} |  #{team.draw_count} |  #{team.loss_count} |  #{team.points}\n"
          string << team_name
          string << result
        end
      end
      private
        def header
          "Team".ljust(31) << "| MP |  W |  D |  L |  P\n"
        end
    end
  end
  class InputParser
    REGEX = /(?<team_1_name>.+);(?<team_2_name>.+);(?<team_1_match_result>.+)/
    class << self
      def call(input)
        lines = input.split("\n")
        lines.each_with_object([]) do |line, array|
          groups = REGEX.match(line)
          team_1_match_result = groups[:team_1_match_result].to_sym
          team_2_match_result= result_by_another_team_result(team_1_match_result)
          array << { team_name: groups[:team_1_name], match_result: team_1_match_result }
          array << { team_name: groups[:team_2_name], match_result: team_2_match_result }
        end
      end
      private
        def result_by_another_team_result(result)
          return  result if result == :draw
          return :loss if result == :win
          :win
        end
    end
    class MatchResult
      attr_reader :team_name, :result
      def initialize(team_name, result)
        @team_name = team_name
        @result = result
      end
    end
  end
  class TeamRepository
    def initialize
      @repository = []
    end
    def find_or_initialize(name, result)
      team = find(name)
      if team
        team.add_result(result)
        return team
      end
      new_team = Team.new(name)
      new_team.add_result(result)
      add(new_team)
      new_team
    end
    def sort_by_point_and_name
      # ソートのやり方、こんな方法もあるのか。。。
      @repository.sort_by { |team| [-team.points, team.name] }
    end
    private
      def find(name)
        @repository.find { |t| t.name == name }
      end
      def add(team)
        @repository << team
      end
  end
  class Team
    attr_reader :name
    def initialize(name)
      @name = name
      @match_results = []
    end
    def add_result(result)
      @match_results << MatchResult.new(result)
    end
    def points
      @match_results.map(&:point).sum
    end
    def matches_count
      @match_results.count
    end
    def win_count
      @match_results.count(&:win?)
    end
    def loss_count
      @match_results.count(&:loss?)
    end
    def draw_count
      @match_results.count(&:draw?)
    end
  end
  class MatchResult
    attr_reader :point
    POINT_MAP = {
      win: 3,
      draw: 1,
      loss: 0
    }
    def initialize(result)
      @result = result.to_sym
      @point = POINT_MAP[@result]
    end
    # 書き方の意図と意味は？
    [:win, :loss, :draw].each do |match_result|
      define_method "#{match_result}?" do
        match_result == @result
      end
    end
  end
end
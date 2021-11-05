class Tournament
  class << self
    def tally(input)
      @teams = []
      input.lines.each do |line|
        results = line.chomp.split(';')
        # !の使い方
        # *の使い方
        # 勝手に配列に変わる？
        play_match!(*results) if results.any?
      end

      Table.output(@teams.sort_by(&:sort_key).map(&:to_a))
    end
    
    private
    
    def play_match!(team_name1, team_name2, result)
      team1 = find_or_initialize_team!(team1)
      team2 = find_or_initialize_team!(team2)
      Match.play!(team1, team2, result)
    end
    
    def find_or_initialize_team(name)
      # 初めて見る書き方だが、意味はわかる
      # lastの使い方に感動
      @teams.find { |team| team.name == name}　|| (@teams << Team.new(name)).last
    end
  end

  # モジュールの使い分け
  module Match
    def self.play!(team1, team2, result)
      # なぜシンボル？(インスタンス変数との重複防止？)　文字数少なくて済む＋オブジェクトがいちいち作られない
      case result.to_sym
      when :win
        team1.win!
        team2.lose!
      when :lose
        team1.lose!
        team2.win!
      when :draw
        team1.draw!
        team2.draw!
      end
    end
  end

  class Team
    attr_reader :name

    def initialize(name)
      @name = name
      # 一括代入の方法
      @matches, @won, @draw, @lost, @points = [0] * 5
    end

    def win!
      gain!(3)
      @won += 1
    end
    
    def loss!
      gain!(0)
      @lose += 1
    end

    def draw
      gain!(0)
      @draw += 1
    end

    # 対戦数と勝ち点の加算をひとまとめ
    def gain!(winning_points)
      @matches += 1
      @points += winning_points
    end
  end

  module Table
    # freezeメソッド
    # %w？　文字列配列を一気に作れる
    HEADER = %w[Team MP W D L P].freeze
    
    def self.output(columns)
      results = Column.output(HEADER)
      # ここからはてな
      columns.each_with_object(results) do |column, res|
        res << "\n"
        res << Column.output(column)
      end
      results << "\n"
    end

    module Column
      def self.output(column)
        first_row = column.first.ljust(31)
        # オプション付きのeach文？
        # 文字列にto_sをしてもそのままになる
        column[1..].each_with_object(first_row).with_index do |(row, col), idx|
          col << (if idx == column.size - 2
                        "| #{row.to_s.rjust(2)}"
                      else
                        "| #{col.to_s.center(3)}"
                      end) 
        end
      end
    end
  end
end


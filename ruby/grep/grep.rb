# `-n` 一致した各行の行番号を出力します。
# `-l` 少なくとも一つのマッチした行を含むファイルの名前のみを出力します。
# `-i` 大文字小文字を区別せずに比較して行をマッチさせます。
# `-x` マッチした行を含む行ではなく、行全体をマッチさせます。
# `-v` プログラムを反転させて、パターンにマッチしなかったすべての行を集めます。

class Grep
  class << self
    
    def grep(pattern, flags, files)
      files.each_with_object([]){|file_name, a|
        # もし複数ファイル参照していた場合は、先頭にファイル名をつける
        lines = Lines.new(file_name).output(pattern, flags)
        lines.nil? ? 
        ''
        : a << lines.map{|l|
                !flags.include?('-l') && files.size > 1 ?
                "#{file_name}:#{l}" : l
              }.reject(&:empty?).join("\n")
            }.reject(&:empty?).join("\n")
    end
    
  end
  
end


class Lines
  def initialize(file_name)
    @name = file_name
    @lines = File.read(file_name).split("\n")
  end

  # 文字列とフラグから正規表現を返す
  def adjust_regex(pattern, flags)
    pattern = "^#{pattern}$" if flags.include?('-x')
    flags.include?('-i') ?
      Regexp.new(pattern.downcase, Regexp::IGNORECASE) : Regexp.new(pattern)
  end
  
  def output(pattern, flags)
    # @lines.map!.with_index{|l, idx| flags.include?('-n') ? "#{idx+1}:#{l}" : l }
    
    output_lines = pick_up_from_lines(adjust_regex(pattern, flags), flags)
    # binding.irb
    output_lines = @lines - output_lines if flags.include?('-v')
    if flags.include?('-l')
      [@name] unless output_lines.empty?
    else
      output_lines
    end
  end


  private

    def pick_up_from_lines(regexp, flags)
      @lines.each_with_index.inject([]){|a, (l, idx)|
        # binding.irb
        if l.match?(regexp)
          l = "#{idx+1}:#{l}" if flags.include?('-n')
          a << l
        else
          a
        end

      }
    end
end
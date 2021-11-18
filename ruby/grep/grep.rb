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
        a << Lines.new(file_name).output(pattern, flags).map{|l|
          !flags.include?('-l') && files.size > 1 ?
          "#{file_name}:#{l}" : l
        }.join("\n")
      }.join("\n")
    end
    
  end
  
end


class Lines
  def initialize(file_name)
    @name = file_name
    @lines = File.read(file_name).split("\n")
  end
  
  def output(pattern, flags)
    regexp_of_flags = {
      '-i' => Regexp.new(pattern, Regexp::IGNORECASE),
      '-x' => Regexp.new("^#{pattern}$")
    }
    @lines.map!.with_index{|l, idx| flags.include?('-n') ? "#{idx+1}:#{l}" : l }
    
    output_lines = pick_up_from_lines(Regexp.new(pattern))
    regexp_of_flags.each{|flag, reg|
      output_lines = @lines & pick_up_from_lines(reg) if flags.include?(flag)
    }
    output_lines = @lines - output_lines if flags.include?('-v')
    
    if flags.include?('-l')
      @name unless output_lines.empty?
    else
      output_lines
    end
  end


  private

    def pick_up_from_lines(regexp)
      @lines.each_with_object([]){|l, a|
        a << l if l.match?(regexp)
      }
    end
end
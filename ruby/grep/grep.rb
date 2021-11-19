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
              }
            }.reject(&:empty?).join("\n")
    end
    
  end
  
end


class Lines
  def initialize(file_name)
    @name = file_name
    @lines = File.read(file_name).split("\n")
  end

  
  def output(pattern, flags)
    
    output_lines = pick_up_from_lines(adjust_regex(pattern, flags), flags)
    output_lines = @lines - output_lines if flags.include?('-v')
    if flags.include?('-l')
      [@name] unless output_lines.empty?
    else
      output_lines
    end
  end
  
  
  private
  
    # 文字列とフラグから正規表現を返す
    def adjust_regex(pattern, flags)
      pattern = "^#{pattern}$" if flags.include?('-x')
      flags.include?('-i') ?
        Regexp.new(pattern.downcase, Regexp::IGNORECASE) : Regexp.new(pattern)
    end
    
    def pick_up_from_lines(regexp, flags)
      @lines.each_with_index.inject([]){|a, (l, idx)|
        if l.match?(regexp)
          l = "#{idx+1}:#{l}" if flags.include?('-n')
          a << l
        else
          a
        end

      }
    end
end
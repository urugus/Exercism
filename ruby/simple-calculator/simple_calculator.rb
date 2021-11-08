class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class << self
    def calculate(first_operand, second_operand, operation)
      # より短く書く場合
      raise ArgumentError unless [first_operand, second_operand].all? {|v| v.class == Integer}
      if operation == '/'
        return "Division by zero is not allowed." if second_operand == 0
      end
      raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
      answer = eval("#{first_operand} #{operation} #{second_operand}")
      output(first_operand, operation, second_operand, answer)

      # レビュー後回答
      # raise ArgumentError unless [first_operand, second_operand].all? {|v| v.class == Integer}
      # answer = case operation
      # when '+'
      #   first_operand + second_operand
      # when '/'
      #   return "Division by zero is not allowed." if second_operand == 0
      #   first_operand / second_operand
      # when '*'
      #   first_operand * second_operand
      # else
      #   raise UnsupportedOperation
      # end
      # output(first_operand, operation, second_operand, answer)
    end

    def output(first_operand, operation, second_operand, answer)
      "#{first_operand} #{operation} #{second_operand} = #{answer}"
    end

  end
  
  # エラーもクラス　＊スタンダードエラーを継承する必要がある
  class UnsupportedOperation < StandardError
  end


end

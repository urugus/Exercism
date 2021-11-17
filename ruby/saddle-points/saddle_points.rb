class Matrix
  def initialize(input)
    @input = input
  end
  
  def rows
    @input.split("\n").map(&:split).map{|i| i.map(&:to_i)}
  end
  
  def columns
    rows.transpose
  end
  
  # 最大のインデックスを全て特定
  def max_of_array(array)
    return [] if array.nil?
    array.each_index.select{|i| array[i]==array.max}
  end

  # 最小のインデックスを全て特定
  def min_of_array(array)
    return [] if array.nil?
    array.each_index.select{|i| array[i]==array.min}
  end

  def saddle_points
    # 1行目から順番に確認
    [*0..columns.length-1].each_with_object([]){|r_idx, applicable_indexes|
      applicable_indexes << max_of_array(rows[r_idx]).each_with_object([]){|c_idx, min_rows|
        min_rows << [r_idx, c_idx] if min_of_array(columns[c_idx]).include?(r_idx)
      }.flatten
    }.delete_if(&:empty?)
  end
end



# メモ

#         row col      row             idx
# 4 5 4 => 0: [1]   => [0,1,2]  => [0,1]
# 3 5 5 => 1: [1,2] => [0,1,2]  => [1,1], [1, 2]
# 1 5 4 => 2: [1]   => [0,1,2]  => [2,1]
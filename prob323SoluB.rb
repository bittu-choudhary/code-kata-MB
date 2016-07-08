#Not working
total_loop = 1
max_num = 2**32
all_ones = max_num - 1
prob = 1000000000000
new_expected_value = 0
previous_len = 0
previous_sum = 0
while
  loop_count = 1
  bitwise_or_value = 0
  catch :jump_to_outer do
    while
      random =  Random.rand(max_num)
      bitwise_or_value = bitwise_or_value | random
      if bitwise_or_value == all_ones
        throw :jump_to_outer
      else
        loop_count = loop_count + 1
      end
    end
  end
  previous_len = previous_len + 1
  previous_sum = previous_sum + loop_count
  new_expected_value = (previous_sum.to_f)/(previous_len.to_f)
  if total_loop % 10000 == 0
    p "previous_sum is #{previous_sum}, total_loop is #{total_loop}, new_expected_value is #{new_expected_value}"
  end
  total_loop = total_loop + 1
end
# p "final total_loop is #{total_loop}, new_expected_value is #{new_expected_value}"
#starts at 01:14

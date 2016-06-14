max_num = 2**32
previous_avg = 0
previous_sum =0
new_avg = 0
previous_len = 0
count = 0
while
  i = 1
  count = count + 1
  bitwise_or_value = Random.rand(max_num)
  catch :jump_to_outer do
    while
      if (bitwise_or_value == ((max_num) - 1))
        throw :jump_to_outer
      else
        x = Random.rand(max_num)
        if  ((bitwise_or_value | x) == ((max_num) - 1))
          throw :jump_to_outer
        else
          bitwise_or_value = bitwise_or_value | x
          i = i + 1
        end
      end
    end
  end
  new_avg = (previous_sum + i).to_f/(previous_len + 1).to_f
  previous_sum = previous_sum + i
  previous_len = previous_len + 1
  if ((new_avg - previous_avg).abs <= 0.0000000001 && count > 1000000) || count > 100000000
    break
  end
  if count % 10000 == 0
    p "loop count: #{count}, difference is #{new_avg - previous_avg}"
  end
  previous_avg = new_avg
end

p "new_avg is #{new_avg}"

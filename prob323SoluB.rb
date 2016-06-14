def decimals(a)
    num = 0
    while(a != a.to_i)
        num += 1
        a *= 10
    end
    num
end
loop_count = 0
bitwise_or_value = 0
max_num = 2**32
expected_value = 0
while decimals(expected_value) < 10
  while
    random =  Random.rand(max_num - 1)
    # p bitwise_or_value
    # p "previous"
    bitwise_or_value = bitwise_or_value | random
    if bitwise_or_value == (max_num - 1)
      # p random
      # p bitwise_or_value
      # p "new"
      # p loop_count
      break
    else
      loop_count = loop_count + 1
    end
  end
  p "out of break with #{loop_count}"
  expected_value = expected_value + loop_count.to_f/max_num.to_f
end
p "decimal value in #{expected_value} is #{decimals(expected_value)}"

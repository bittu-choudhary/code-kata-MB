# max_num = 2**32
# all_ones = max_num - 1
# total_loop = 0
# while total_loop < 100
#   loop_count = 1
#   bitwise_or_value = 0
#   total_loop = total_loop + 1
#   while
#     random =  Random.rand(max_num)
#     bitwise_or_value = bitwise_or_value | random
#     if bitwise_or_value == all_ones
#       break
#     else
#       loop_count = loop_count + 1
#     end
#   end
#   p "N is #{loop_count}"
# end
a = []
count = 0
while
  a << Random.rand(10)
  if count == 100000
    p a.length
  end
  count = count + 1
end

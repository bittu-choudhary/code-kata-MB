integer = 1
loop_count = 1
while
  # converting integer to string then using split method to convert it into array of digit characters then sorting them and comparing with multiple of 2,3,4,5,6
  loop_count = loop_count + 1
  digit_array = integer.to_s.split(//).sort
  if ( ((integer*2).to_s.split(//).sort == digit_array) && ((integer*3).to_s.split(//).sort == digit_array) && ((integer*4).to_s.split(//).sort == digit_array) && ((integer*5).to_s.split(//).sort == digit_array) && ((integer*6).to_s.split(//).sort == digit_array) )
    p "Desired Integer"
    p integer
    break
  end
  integer = integer + 1
end
p "Loop Count"
p loop_count

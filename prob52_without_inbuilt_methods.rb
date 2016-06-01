class PermutedMultiples
  def self.get_array(number,x=10,y=1,array_of_digits = [])
   (1..(Math.log10(number).to_i + 1)).each do
   array_of_digits << (number%x)/y
   x = x*10
   y = y*10
   end
   return array_of_digits.sort
  end
  integer = 1
  while
    integer_array = get_array(integer)
    if integer_array == get_array(integer*2) && integer_array == get_array(integer*3) && integer_array == get_array(integer*4) && integer_array == get_array(integer*5) && integer_array == get_array(integer*6)
      p integer
      break
    end
    integer = integer + 1
  end
end

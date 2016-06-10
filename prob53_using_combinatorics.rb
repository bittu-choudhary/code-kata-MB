require 'benchmark'
time = Benchmark.realtime{
  count = 0
  loop_count = 0
  first = 1
  (2..100).each do |n|
    if (n.downto(1).inject(:*)/(((n/2).downto(1).inject(:*))*((n - (n/2)).downto(1).inject(:*)))) > 1000000
      half_of_n = n/2
      new_count = 0
      half_of_n.downto(1).each do |r|
        loop_count = loop_count + 1
          if ((n.downto(1).inject(:*))/((r.downto(1).inject(:*))*(n-r).downto(1).inject(:*))) > 1000000
            new_count = new_count + 1
          else
            break
          end
      end
      count = count + ( n % 2 == 0 ? (2*new_count - 1) : 2*new_count )
    end
  end
  p "Answer is #{count}"
  p "loop_count #{loop_count}"}
p "time taken #{time}"

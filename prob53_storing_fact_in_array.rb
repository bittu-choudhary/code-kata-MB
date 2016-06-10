require 'benchmark'
time = Benchmark.realtime{
  fact_hash = Hash.new
  def calc_fact(num,fact_hash)
    if fact_hash[num]
      return fact_hash[num]
    else
      fact_hash[num] = num.downto(1).inject(:*)
      return fact_hash[num]
    end
  end
  count = 0
  loop_count = 0
  first = 1
  (2..100).each do |n|
    if (calc_fact(n,fact_hash)/(calc_fact(n/2,fact_hash)*(calc_fact(n - (n/2),fact_hash)))) > 1000000
      half_of_n = n/2
      new_count = 0
      half_of_n.downto(1).each do |r|
        loop_count = loop_count + 1
          if (calc_fact(n,fact_hash)/(calc_fact(r,fact_hash)*(calc_fact(n - r,fact_hash)))) > 1000000
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

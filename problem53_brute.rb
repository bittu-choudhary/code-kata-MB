require 'benchmark'
time = Benchmark.realtime{count = 0
  (1..100).each{|n| (1..n).each{|r|  (((n-r) == 0) ? next :  ((((n.downto(1).inject(:*))/((r.downto(1).inject(:*))*(n-r).downto(1).inject(:*))) > 1000000) ? (count = count + 1) : next))}}
p "Answer is #{count}"}
p "time taken #{time}"

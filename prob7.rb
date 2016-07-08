def mod_exp(n, e, mod)
  fail ArgumentError, 'negative exponent' if e < 0
  prod = 1
  base = n % mod
  until e.zero?
    prod = (prod * base) % mod if e.odd?
    e >>= 1
    base = (base * base) % mod
  end
  prod
end

def miller_rabin_prime?(n, g)
  d = n - 1
  s = 0
  while d % 2 == 0
    d /= 2
    s += 1
  end
  g.times do
    a = 2 + rand(n - 4)
    x = mod_exp(a, d, n) # x = (a**d) % n
    next if x == 1 || x == n - 1
    for r in (1..s - 1)
      x = mod_exp(x, 2, n) # x = (x**2) % n
      return false if x == 1
      break if x == n - 1
    end
    return false if x != n - 1
  end
  true # probably
end
require 'benchmark'
time = Benchmark.realtime{
i = 3
max = 1
until max == 10001
  if miller_rabin_prime?(i,10)
    i = i + 2
    max = max + 1
  else
    i = i + 2
  end
end
p i - 2}
p "time taken #{time}"
#
# def ln(n)
#   return Math.log(n,2.718281828459)
# end
#
# def nth_prime(n)
#   return n*(Math.log(n,2.718281828459) + Math.log(Math.log(n,2.718281828459)) - 1 +((Math.log(Math.log(n,2.718281828459)) - 2)/Math.log(n,2.718281828459)) - ((Math.log(Math.log(n,2.718281828459))*Math.log(Math.log(n,2.718281828459)) - 6*Math.log(Math.log(n,2.718281828459)) + 11)/2*Math.log(n,2.718281828459)*Math.log(n,2.718281828459)) )
# end

cities_and_years  = { Vilnius: 1970, Warsaw: 1994, Oslo: 2000 }
cities_and_years2 = { London: 2009, Oslo: 2015, New_York: 2019  }

p cities_and_years.merge(cities_and_years2)
p cities_and_years
p cities_and_years2

# 'merge' returns a new hash, but doesn't change any of the original hashes.

puts ' '

p cities_and_years.merge!(cities_and_years2)
p cities_and_years
p cities_and_years2

# 'merge!' returns a new hash and modifies the one we called it on.

cities_and_years  = { Vilnius: 1970, Warsaw: 1994, Oslo: 2000 }

cities_and_years.each_key { |k| puts k }
cities_and_years.each_value { |v| puts v }
cities_and_years.each { |k, v| puts "#{k}: #{v}" }

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

names = munsters.keys

names.each do |name|
  case munsters[name]['age']
  when 0..17  then munsters[name]['age_group'] = 'kid'
  when 18..64 then munsters[name]['age_group'] = 'adult'
  else             munsters[name]['age_group'] = 'senior'
  end
end

p munsters
puts '-----'

# Or:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  if info['age'] < 18
    info['age_group'] = 'kid'
  elsif info['age'] < 64
    info['age_group'] = 'adult'
  else
    info['age_group'] = 'senior'
  end
end

p munsters

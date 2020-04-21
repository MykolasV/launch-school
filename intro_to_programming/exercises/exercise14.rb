contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}

until contact_data.empty? do 
  [:email, :address, :phone].each do |key|
    contacts['Joe Smith'][key] = contact_data.shift
  end
end

p contacts

# Bonus:
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts.each_with_index do |(name, hash), idx|
  [:email, :address, :phone].each do |key|
    hash[key] = contact_data[idx].shift
  end
end

p contacts

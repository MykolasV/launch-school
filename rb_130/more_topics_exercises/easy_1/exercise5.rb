def decipher(string)
  alphabet = [*'a'..'z']
  result = ''

  string.each_char do |char|
    unless alphabet.include?(char.downcase)
      result += char
      next
    end

    position = alphabet.index(char.downcase)
    new_position = (position - 13) % alphabet.size

    result += if char.downcase == char
                alphabet[new_position]
              else
                alphabet[new_position].upcase
              end
  end

  result
end

p decipher('Nqn Ybirynpr')
p decipher('Tenpr Ubccre')
p decipher('Nqryr Tbyqfgvar')
p decipher('Nyna Ghevat')
p decipher('Puneyrf Onoontr')
p decipher('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p decipher('Wbua Ngnanfbss')
p decipher('Ybvf Unvog')
p decipher('Pynhqr Funaaba')
p decipher('Fgrir Wbof')
p decipher('Ovyy Tngrf')
p decipher('Gvz Orearef-Yrr')
p decipher('Fgrir Jbmavnx')
p decipher('Xbaenq Mhfr')
p decipher('Fve Nagbal Ubner')
p decipher('Zneiva Zvafxl')
p decipher('Lhxvuveb Zngfhzbgb')
p decipher('Unllvz Fybavzfxv')
p decipher('Tregehqr Oynapu')

puts '-----'

# Given solution

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end

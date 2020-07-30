# class BeerSong
#   def array_of_verses
#     all_verses = []
#     99.downto(0) do |number|
#       if (3..99).cover?(number)
#         all_verses << "#{number} bottles of beer on the wall, #{number} bottles" \
#         " of beer.\nTake one down and pass it around, #{number - 1} bottles" \
#         " of beer on the wall.\n"
#       elsif number == 2
#         all_verses << "2 bottles of beer on the wall, 2 bottles of beer." \
#         "\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
#       elsif number == 1
#         all_verses << "1 bottle of beer on the wall, 1 bottle of beer." \
#         "\nTake it down and pass it around, no more bottles of beer" \
#         " on the wall.\n"
#       else
#         all_verses << "No more bottles of beer on the wall, no more bottles" \
#         " of beer.\nGo to the store and buy some more, 99 bottles of beer" \
#         " on the wall.\n"
#       end
#     end
#     all_verses
#   end

#   def verse(number)
#     array_of_verses[array_of_verses.size - 1 - number]
#   end

#   def verses(starting_number, ending_number)
#     selected = []
#     starting_number.downto(ending_number) do |number|
#       selected << verse(number)
#     end
#     selected.join("\n")
#   end

#   def lyrics
#     array_of_verses.join("\n")
#   end
# end

# BONUS

module BeerSongVerses
  class Verse
    def initialize(number)
      @number = number
    end

    def text
      "#{@number} bottles of beer on the wall, #{@number} bottles " \
      "of beer.\nTake one down and pass it around, #{@number - 1} bottles " \
      "of beer on the wall.\n"
    end
  end

  class Verse2 < Verse
    def text
      "2 bottles of beer on the wall, 2 bottles of beer." \
      "\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    end
  end

  class Verse1 < Verse
    def text
      "1 bottle of beer on the wall, 1 bottle of beer." \
      "\nTake it down and pass it around, no more bottles of beer " \
      "on the wall.\n"
    end
  end

  class Verse0 < Verse
    def text
      "No more bottles of beer on the wall, no more bottles " \
      "of beer.\nGo to the store and buy some more, 99 bottles of beer " \
      "on the wall.\n"
    end
  end
end

class BeerSong
  include BeerSongVerses

  VERSE_LOOKUP = { 3..99 => Verse, 2 => Verse2, 1 => Verse1, 0 => Verse0 }

  def verse(number)
    selected_verse = VERSE_LOOKUP.select { |k, v| k === number }.values.first
    selected_verse.new(number).text
  end

  def verses(starting_number, ending_number)
    selected = []
    starting_number.downto(ending_number) do |number|
      selected << verse(number)
    end
    selected.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

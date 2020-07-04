class TextAnalyzer
  def process
    File.open('exercise2.txt', 'r') do |file|
      yield(file.read)
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split.size} words" }

puts '-----'

# Given solution

class TextAnalyzer
  def process
    file = File.open('exercise2.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }

class Banner
  MAX_WIDTH = 80

  def initialize(message, width = nil)
    if width.to_s.empty? || width < message.size
      @message = message
      @width = message.size
    else
      @width = width > MAX_WIDTH ? MAX_WIDTH : width
      @width -= 4 # looking at methods: 2 chars + @width + 2 chars
      @message = message.center(@width)
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
banner = Banner.new('')
puts banner
banner = Banner.new('Hello World!', 25)
puts banner
banner = Banner.new('Hello World!', 1)
puts banner
banner = Banner.new('Hello World!', 1000)
puts banner

module CircularBufferError
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end

class CircularBuffer
  include CircularBufferError

  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    raise BufferEmptyException if @buffer.empty?
    @buffer.shift
  end

  def write(element)
    return unless element
    raise BufferFullException if full?

    @buffer << element
  end

  def write!(element)
    if full?
      element && read && @buffer << element
    else
      write(element)
    end
  end

  def full?
    @buffer.size == @size
  end

  def clear
    @buffer.clear
  end
end

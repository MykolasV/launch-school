class School
  def initialize
    @archive = {}
  end

  def add(name, grade)
    if @archive.key?(grade)
      @archive[grade] << name
    else
      @archive[grade] = [name]
    end
  end

  def grade(number)
    @archive.key?(number) ? @archive[number].sort : []
  end

  def to_h
    @archive.values.each(&:sort!)
    @archive.sort.to_h
  end
end

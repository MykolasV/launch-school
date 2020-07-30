class DNA
  def initialize(original_strand)
    @original_strand = original_strand
  end

  def hamming_distance(other_strand)
    shorter, longer = [@original_strand, other_strand].sort_by(&:length)

    distance = 0
    0.upto(shorter.size - 1) do |index|
      distance += 1 unless shorter[index] == longer[index]
    end

    distance
  end
end

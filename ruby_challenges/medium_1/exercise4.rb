class InvalidCodonError < StandardError; end

class Translation
  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
  def self.of_codon(codon)
    case codon
    when 'AUG'                      then 'Methionine'
    when 'UUU', 'UUC'               then 'Phenylalanine'
    when 'UUA', 'UUG'	              then 'Leucine'
    when 'UCU', 'UCC', 'UCA', 'UCG' then 'Serine'
    when 'UAU', 'UAC'               then 'Tyrosine'
    when 'UGU', 'UGC'	              then 'Cysteine'
    when 'UGG'                      then 'Tryptophan'
    when 'UAA', 'UAG', 'UGA'        then 'STOP'
    else               raise InvalidCodonError, "codon '#{codon}' doesn't exist"
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength

  def self.of_rna(strand)
    strand.scan(/.../).each_with_object([]) do |codon, proteins|
      translation = of_codon(codon)
      return proteins if translation == 'STOP'

      proteins << translation
    end
  end
end

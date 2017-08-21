# mapping: digit -> ['a', 'c', 'b']
def mnemonic(mapping, number_sequence)
  return [] if number_sequence.length == 0
  # p number_sequence.length
  # p number_sequence.to_i
  # p mapping[number_sequence.to_i]
  return mapping[number_sequence.to_i].split("") if number_sequence.length == 1
  seq = mnemonic(mapping, number_sequence[1..-1])
  first_char_mapping = mapping[number_sequence[0].to_i].split("")

  all_seq = seq.map do |s|
    ss = [];
    first_char_mapping.each do |c|
      ss.push(c + s)
    end
    ss
  end

  all_seq.flatten
end

MAPPING = ['0', '1', 'ABC', 'DEF', 'GHI', 'JKL', 'MNO', 'PQRS', 'TUV', 'WXYZ']


p mnemonic(MAPPING, '2276696')

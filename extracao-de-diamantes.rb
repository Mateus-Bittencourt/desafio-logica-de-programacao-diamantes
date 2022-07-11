def extracao_de_diamantes(exp)
  # puts exp
  exp.gsub!('.', '')
  # puts exp
  total_diamantes = 0
  exp = exp.chars
  # p exp
  soma_diamantes = 1
  diamantes = ''

  until soma_diamantes.zero?

    soma_diamantes = 0
    indices = []
    exp.each_with_index do |_, index|
      next unless exp[index] == '<' && exp[index + 1] == '>'

      diamantes << '<>'
      # puts diamantes
      soma_diamantes += 1
      # puts soma_diamantes
      indices << index
      indices << index + 1
    end
    indices.reverse!.each do |char|
      exp.delete_at(char)
    end
    total_diamantes += soma_diamantes
    # puts total_diamantes
  end

  {
    exp: exp.join,
    diamantes: diamantes,
    total_diamantes: total_diamantes
  }
end

exp = '<<.<<..>><>><.>.>.<<.>.<.>>>><>><>>'

puts extracao_de_diamantes(exp)

pi = 3.14159265359 

puts "Diâmetro:"
diametro = gets.to_i

puts "Curso:"
curso = gets.to_i

puts "Quantidade de óleo:"
quant = gets.to_i

cilind = ((diametro* diametro * pi)/4000) * curso

puts "\nCilindrada: #{cilind.round(2)}"

resultado = (cilind + quant)/quant

puts "\nTaxa de compreensão: #{resultado.round(2)}"

#var = cot.pop #retorna o ultimo elemento de um vetor
#var = cot.pop #retorna o ultimo elemento de um vetor

#Volume dos produtos
item = []
item[0] = 10000000000
item[1] = 12500000000

#Volume limite das caixas
box = []
box[0] = 1000
box[1] = 1000000
box[2] = 1000000000


total_vol = 0


item.each do |item|
  total_vol += item
end


puts "Total Voluma: #{total_vol}"

aux = []

ant = box.count
at = box.count-1
atr = box.count-2

for i in 0..at
  aux[i] = 0
end

controller = total_vol

while controller != 0

  if total_vol <= box.first
    aux[0] += 1
  end

  for i in 0..at

    if box[i-1] < total_vol and total_vol <= box[i]
      aux[i] += 1
    end

  end

  if box[at] < total_vol
    total_vol = total_vol - box[at]
    aux[at] += 1
  else
    controller = 0
  end

end

for i in 0..at
  puts "Caixa #{i}: #{aux[i]}"
end

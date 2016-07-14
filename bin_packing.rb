#Volume dos produtos
item = []
item[0] = 1876
item[1] = 33609
item[2] = 357643
#Peso dos produtos
item_width = []
item_width[0] = 23
item_width[1] = 29
item_width[2] = 200

#Volume limite das caixas
box = []
box[0] = 4374
box[1] = 46750
box[2] = 48976
box[3] = 52488
#Peso limite das caixas
box_width = []
box_width[0] = 34
box_width[1] = 75
box_width[2] = 85
box_width[3] = 105


total_vol = 0
total_width = 0

item.each do |item|
  total_vol += item
end

item_width.each do |item_width|
  total_width += item_width
end
puts "Total Voluma: #{total_vol}"
puts "Total Peso: #{total_width}"

aux = []

ant = box.count
at = box.count-1
atr = box.count-2

for i in 0..at
  aux[i] = 0
end

controller = total_vol
controller_width = total_width

while controller != 0 and controller_width != 0

  if total_vol <= box.first and (total_width <= box_width.first or total_width < 0)
    aux[0] += 1
  end

  for i in 0..at

    if box[i-1] < total_vol and total_vol <= box[i] and (box_width[i-1] < total_width and total_width <= box[i] or total_width <= 0)
      aux[i] += 1
    end

  end

  if box[at] < total_vol or box_width[at] < total_width
    total_vol = total_vol - box[at]
    total_width = total_width - box_width[at]
    aux[at] += 1
  else
    controller = 0
    controller_width = 0
  end

end

puts aux

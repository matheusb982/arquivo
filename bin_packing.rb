var1 = []
var1[0] = 3360
var1[1] = 3360
var1[2] = 6912
var1[3] = 69128
cont = []
total = 0

box = []
box[0] = 35698
box[1] = 13982
box[2] = 19857

cot = []

var1.each do |var1|
  total += var1
end
puts total

pes = total

while pes != 0

total = pes
tt = box.count

for i in 0..tt-1
  if total <= box[i]
    cot[i] = cot[i]+i+1
  else
    cot[i] = 0
  end
end

if  total > box[tt-1]
  cot[tt-1] = cot[tt-1] + tt
  total = total - box[tt-1]
  pes = total
else
  pes = 0
end

end

cot.each do |cot|
  puts cot
end




#var = cot.pop #retorna o ultimo elemento de um vetor

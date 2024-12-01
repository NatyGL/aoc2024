#On initialise les deux listes
list_l = []
list_r = []

#On extrait les nombres du ficher et on les intègre dans list_l et list_r en fonction de leur index
File.open("input.txt", "r") do |file|
  file.each_line do |line|
    line.scan(/\d+/).map(&:to_i).each.with_index { |num, i| i.even? ? list_l << num : list_r << num}
  end
end


#On multiplie le similarity score (nombre * occurence du nombre dans list_r) et on calcule le total
similarity_score = list_l.map { |num| num * list_r.count(num)}.sum
puts similarity_score

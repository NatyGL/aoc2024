#On initialise les deux listes
list_l = []
list_r = []

#On extrait les nombres du ficher et on les intègre dans list_l et list_r en fonction de leur index
File.open("input.txt", "r") do |file|
  file.each_line do |line|
    line.scan(/\d+/).map(&:to_i).each.with_index { |num, i| i.even? ? list_l << num : list_r << num}
  end
end

#On trie les liste de manière ascendante
list_l.sort!
list_r.sort!

#On calcule la distance entre deux nombres de chaque liste et on calcule le total
distances = list_l.zip(list_r).map { |l, r| (l - r).abs }
puts distances.sum

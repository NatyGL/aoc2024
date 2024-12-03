reports = []

File.open("input.txt", "r") do |file|
  # On ajoute les reports ordonnés croissants ou décroissants
  file.each_line do |line|
    nums = line.split.map(&:to_i)
    reports << nums if nums == nums.sort || nums == nums.sort.reverse
  end
end

# Filtrage des reports valides selon la différence entre les éléments
reports_valid = reports.select do |report|
  report.each_cons(2).all? { |a, b| (a - b).abs.between?(1, 3) }
end

# Affichage du nombre de reports valides
if reports_valid.any?
  puts "Nombre de reports valides : #{reports_valid.size}"
else
  puts "Aucun report valide trouvé."
end

reports = []

# Lecture du fichier et ajout des rapports dans la liste
File.open("input.txt", "r") do |file|
  file.each_line do |line|
    nums = line.split.map(&:to_i)
    reports << nums
  end
end

reports_valid = []

# Fonction pour vérifier si un rapport est valide
def valid_report?(report)
  # Initialisation des variables pour vérifier l'ordre des niveaux
  is_increasing = true
  is_decreasing = true

  # Parcours des éléments du rapport pour vérifier l'ordre
  (0...report.size - 1).each do |i|
    diff = report[i] - report[i + 1]

    # Si la différence entre les niveaux est inférieure à 1 ou supérieure à 3, c'est un échec
    return false if diff.abs < 1 || diff.abs > 3

    # Vérifie si le rapport est croissant ou décroissant
    if diff <= 0
      is_increasing = false
    end

    if diff >= 0
      is_decreasing = false
    end
  end

  # Vérifie si le rapport est croissant ou décroissant
  if is_increasing || is_decreasing
    # Si le rapport est valide et il y a un ou aucun doublon
    return report.uniq.size == report.size || report.uniq.size == report.size - 1
  end

  # Sinon, c'est un rapport invalide
  false
end

# Traitement des rapports
reports.each do |report|
  # Si le rapport est déjà valide, on l'ajoute directement
  if valid_report?(report)
    reports_valid << report
  else
    # On tente de supprimer un élément à la fois et de vérifier si le rapport devient valide
    (0...report.size).each do |index|
      modified_report = report[0...index] + report[(index + 1)..-1]

      # Si le rapport modifié est valide, on l'ajoute à reports_valid et on quitte la boucle
      if valid_report?(modified_report)
        reports_valid << modified_report
        break
      end
    end
  end
end

# Affichage du nombre de rapports valides
puts reports_valid.size


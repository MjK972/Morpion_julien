#la classe Player permet de définir le joueur: son nom et son jeton
class Player
  attr_accessor :name, :mark
#initialise la classe Player avec les valeurs de bases
  def initialize(name, mark, board)
    @name = name
    @mark = mark
    @board = board
  end
#permet mettre à jour les takens en fonction de la valeur déterminée par le joueur
  def move(cell)
    @board.update_cell(cell, self.mark)
  end
# Définition des combinaisons gagnantes
# permet de faire une boucle sur toutes les combinaisons gagnantes et de s'assurer que les jetons sont bien identiques dans l'array
  def winner?
    wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]]
    wins.each do |win|
      values = [cells[win[0]], cells[win[1]], cells[win[2]]]
      return true if values.include?(self.mark.to_s) &&
      ((values[0] == values[1]) && (values[1] == values[2]))
    end
    false
  end

  private
#permet de lier les cellules à la classe joueur
  def cells
    @board.cells
  end

end
# Classe définissant le plateau de jeu
class Board
  attr_accessor :cells
#Permet de mettre à jour le tableau en fonction des inputs du joueur tout en garatissant que la cellule soit vide
  def initialize
    @cells = [
    "1", "2", "3",
    "4", "5", "6",
    "7", "8", "9"
    ]
  end
#Affichage du corps du tableau (valeurs de base + lignes verticales et horizontales)
  def update_cell(number, mark)
    if cell_free?(number)
      self.cells[number - 1] = mark.to_s
      show_board
    else
      puts "Cell not empty! Choose other cell."
      return false
    end
  end

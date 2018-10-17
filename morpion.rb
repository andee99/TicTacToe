class BoardCase
	attr_accessor :valeur, :num

	def initialize(valeur, num)
		@valeur = valeur
		@num = num
	end

	def to_s
		@valeur.to_s
	end
end

class Board
	include Enumerable

	attr_accessor :tabl_case

	def initialize

		@case1 = BoardCase.new("1", 1)
        @case2 = BoardCase.new("2", 2)
        @case3 = BoardCase.new("3", 3)
        @case4 = BoardCase.new("4", 4)
        @case5 = BoardCase.new("5", 5)
        @case6 = BoardCase.new("6", 6)
        @case7 = BoardCase.new("7", 7)
        @case8 = BoardCase.new("8", 8)
        @case9 = BoardCase.new("9", 9)
  
        @tabl_case = [[@case1, @case2, @case3],[@case4, @case5, @case6],[@case7, @case8, @case9]]
	end

    def to_s
    #Pour afficher le plateau
        @tabl_case.each do |x|
            	puts " --- --- ---"
        	    puts "| "+x[0].to_s+" | "+x[1].to_s+" | "+x[2].to_s+" |"
            end
    	        puts " --- --- ---"
	end

	def play(valeur, case_num)

		case case_num
		when 1
			if @tabl_case[0][0].to_s == "1".to_s
				@tabl_case[0][0] = valeur
			else
				puts "Le champ n'est pas vide!! SVP, choississez-en un autre!! "
				return false
			end
		when 2
			if @tabl_case[0][1].to_s == "2".to_s
				@tabl_case[0][1] = valeur
			else
				puts "Le champ n'est pas vide!! SVP, choississez-en un autre!! "
				return false
			end
		when 3
			if @tabl_case[0][2].to_s == "3".to_s
				@tabl_case[0][2] = valeur
			else
				puts "Le champ n'est pas vide!! SVP, choississez-en un autre!! "
				return false
			end
		when 4
			if @tabl_case[1][0].to_s == "4".to_s
				@tabl_case[1][0] = valeur
			else
				puts "Le champ n'est pas vide!! SVP, choississez-en un autre!! "
				return false
			end
		when 5
			if @tabl_case[1][1].to_s == "5".to_s
				@tabl_case[1][1] = valeur
			else
				puts "Le champ n'est pas vide!! SVP, choississez-en un autre!! "
				return false
			end
		when 6
			if @tabl_case[1][2].to_s == "6".to_s
				@tabl_case[1][2] = valeur
			else
				puts "Le champ n'est pas vide!! SVP, choississez-en un autre!! "
				return false
			end
		when 7
			if @tabl_case[2][0].to_s == "7".to_s
				@tabl_case[2][0] = valeur
			else
				puts "Le champ n'est pas vide!! "
				return false
			end
		when 8
			if @tabl_case[2][1].to_s == "8".to_s
				@tabl_case[2][1] = valeur
			else
				puts "Le champ n'est pas vide!! "
				return false
			end
		when 9
			if @tabl_case[2][2].to_s == "9".to_s
				@tabl_case[2][2] = valeur
			else
				puts "Le champ n'est pas vide!! "
				return false
			end
		end


	end

	def victory?

		      #Méthode qui check si quelqu'un a gagné
      if
      #Les cas possibles de victoire
        (@tabl_case[0][0] == @tabl_case[0][1]) && (@tabl_case[0][1] == @tabl_case[0][2]) ||
        (@tabl_case[1][0] == @tabl_case[1][1]) && (@tabl_case[1][1] == @tabl_case[1][2]) ||
        (@tabl_case[2][0] == @tabl_case[2][1]) && (@tabl_case[2][1] == @tabl_case[2][2]) ||
        (@tabl_case[0][0] == @tabl_case[1][0]) && (@tabl_case[1][0] == @tabl_case[2][0]) ||
        (@tabl_case[0][1] == @tabl_case[1][1]) && (@tabl_case[1][1] == @tabl_case[2][1]) ||
        (@tabl_case[0][2] == @tabl_case[1][2]) && (@tabl_case[1][2] == @tabl_case[2][2]) ||
        (@tabl_case[0][0] == @tabl_case[1][1]) && (@tabl_case[1][1] == @tabl_case[2][2]) ||
        (@tabl_case[0][2] == @tabl_case[1][1]) && (@tabl_case[1][1] == @tabl_case[2][0])
      #On retourne true s'il y a un victoire
        true
      else
      #On retourne false sinon
        false 
      end
    end
end

  class Player
    attr_accessor :nom, :valeur
    
    def initialize(nom= nil, valeur= nil)
      #Si on initialize sans un nom, on demande à l'utilisateur de taper son nom
      if nom == nil
        puts "Entrer votre nom: "
        nom = gets.chomp
      end
      @nom = nom
      #Si on initialize sans valeur, on demande à l'utilisateur de choisir un
      if valeur == nil
        puts "Vous choisissez quel valeur? (X ou O) "
        prise = gets.chomp
        while prise != "X" && prise != "O" #Si l'utilisateur choisi un autre valeur que X et O
        puts "Mauvaise choix, reessayer! "
        prise = gets.chomp
        end
        valeur = prise
      end
      @valeur = valeur
      
    end
  
end

class Game
    def initialize
      #On crée 2 joueurs, et un board
      puts "\n\tPour le joueur 1"
      @joueur_1 = Player.new
  
      puts"\n\tPour le joueur 2"
      if @joueur_1.valeur == "X"        #Le deuxième joueur prend la valeur que le premier a laissé
        @joueur_2 = Player.new(nil, "O")
      else
        @joueur_2 = Player.new(nil, "X")
      end
  
      @board = Board.new
  
    end
  
    def go
      # On lance la partie, 
      puts "\n #{@joueur_1.nom} va jouer le premier"
      sleep 2
      turn #On fait appel à la méthode turn ci-dessous
    end
  
    def turn
      #On affiche les cases avec ses numéros
      tab = [["1", "2", "3"],["4", "5", "6"],["7", "8", "9"] ]
      puts "Les cases sont numérotés de manière suivant: "
      tab.each do |x|
        puts " --- --- ---"
        puts "| "+x[0].to_s+" | "+x[1]+" | "+x[2]+" |"
        end
      	puts " --- --- ---"
      sleep 3
  
      boucle = true
      var_intermediaire = 0
      nbr_tour = 1
      #On tourne le boucle
      while boucle
        #Si le nombre de tour est paire, alors c'est le deuxième joueur qui joue
        sleep 2 #Petit pause
        if nbr_tour % 2 == 0
          puts "\n#{@joueur_2.nom}, vous allez vous placez où? (case entre 1 à 9)\n"
        else
          puts "\n#{@joueur_1.nom}, vous allez vous placez où? (case entre 1 à 9)\n"
        end
        #On place dans var_intermediaire le numero de case où le joueur veux placer
        var_intermediaire = gets.chomp
        var_intermediaire = var_intermediaire.to_i
        #Les numéros de case doivent être compris entre 1 à 9
        while (var_intermediaire < 1) || (9 < var_intermediaire) 
          puts "Error, mauvaise endroit. Reessayez ! "
          var_intermediaire = gets.chomp
          var_intermediaire = var_intermediaire.to_i
        end
        #On place la valeur du joueur au numéros du case choisi
        if nbr_tour % 2 == 0
          playing = @board.play(@joueur_2.valeur, var_intermediaire)
        else
          playing = @board.play(@joueur_1.valeur, var_intermediaire)
        end
        #On check si un joueur a placé dans un placement non-vide
        while playing == false
          var_intermediaire = gets.chomp
          var_intermediaire = var_intermediaire.to_i
          if nbr_tour % 2 == 0
            playing = @board.play(@joueur_2.valeur, var_intermediaire)
          else
            playing = @board.play(@joueur_1.valeur, var_intermediaire)
          end
        end
        #On affiche le board à chaque fois
        sleep 1
        @board.to_s
        #On check si quelqu'un a gagné
        if @board.victory? == true
          if nbr_tour % 2 == 0
            puts "#{@joueur_2.nom} a gagné!"
          else
            puts "#{@joueur_1.nom} a gagné!"
          end
        end
        #On affiche le vainqueur et arrête la boucle si on a une victoire
        break if @board.victory? == true
        #On incrémente le nombre de tour sinon 
        nbr_tour += 1
        #On recommence le jeux si le nombre de tour dépasse 9 et si personne n'a gagné
        if nbr_tour == 10
          puts "Match nul, on recommence!"
          nbr_tour = 1
          #On réinitialise la table
          @board.array_case = tab
          @board.to_s
        end
      end
  
    end
  
end

Game.new.go
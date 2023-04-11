module TicTacToe

    class Game
        @@someone_won = false
        @@array_table = [['_','_','_'],['_','_','_'],['_','_','_']]
        def initialize

            puts "Welcome to Tic-Tac-Toe!"

            puts "Insert 1st player name"
            player1_name = gets.chomp

            puts "Insert 2nd player name"
            player2_name = gets.chomp

            puts "Starting game between #{player1_name} and #{player2_name}"

            @player1 = Player.new(player1_name, 'X')
            @player2 = Player.new(player2_name, 'O')

            @current_turn = who_starts
            puts "Tossing a coin..."
            3.times do 
                sleep 1
                puts '.'
            end
            puts "#{@current_turn.name} turn, choose a position"

            run_game(@current_turn)
        end

        def run_game

            unless someone_won
                
            end
            
        end

        def who_starts
            rand(0..1) == 1 ? @player1 : @player2
        end

        def print_table()
            @array_table.each do |row|
                puts "| #{row[0]} #{row[1]} #{row[2]} |"
            end
            return "Current state"
        end

        def update_table()
            
        end

        def check_winner()

        end

    end

    class Player
        attr_reader :name, :symbol

        def initialize(name, symbol)
            @name = name
            @symbol = symbol
        end
    end
    
    
end

include TicTacToe
Game.new()

# alvaro = Player.new('Alvaro','X')
# puts alvaro.name
puts " #{table[0]} \n #{table[1]} \n #{table[2]}"
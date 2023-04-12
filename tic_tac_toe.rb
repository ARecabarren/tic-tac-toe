# require 'pry-byebug'

module TicTacToe
    class Game
        @@someone_won = false
        @@availables_position = 9
        def initialize

            puts "Welcome to Tic-Tac-Toe!"

            puts "Insert 1st player name"
            player1_name = 'alvaro'

            puts "Insert 2nd player name"
            player2_name = 'renata'

            puts "Starting game between #{player1_name} and #{player2_name}"

            @player1 = Player.new(player1_name, 'X')
            @player2 = Player.new(player2_name, 'O')
            @table = Table.new
            @current_turn = who_starts
            puts "Tossing a coin..."
            1.times do 
                sleep 1
                puts '.'
            end

            run_game
        end

        def who_starts
            rand(0..1) == 1 ? @player1 : @player2
        end

        def run_game

            until @@someone_won || @@availables_position == 0
                puts "#{@current_turn.name} turn, choose a position"
                puts "Indicates position as a coordinate separated by a white space. Example: 1 1 (First column - First row)"
                

                #Check correct input
                @correct_input = false
                until @correct_input
                    puts "In loop now"
                    user_move = '1 1'
                    if correct_input?(user_move)

                        if available_position?(user_move,@table.array_table)
                            @table.update_table(user_move, @current_turn.symbol)
                            @@availables_position -= 1
                            @correct_input = true
                        else
                            puts 'Unavailable position'
                            puts 'Please indicates other coordinate'
                        end

                    else
                        puts "Please write a appropiate input. Two number separated by a whitespace"
                    end
                    
                    @table.print_table

                end

                puts "I exit from the unless"
                # Update table

                # Check if current state correspond with winning situation
                    # Finish game if there is a winner
                
                # Check if the avaible positions in the table are at least one
                    # Finish the game if no position availables
                # Display current status of the table


            end
            
        end 

        def correct_input?(user_move)

            if user_move.length != 3
                return false
            elsif user_move[1] != ' '
                return false
            end

            [0,2].each do |position|
                unless user_move[position].to_i.between?(1,3)
                    return false
                end
            end
            return true
        end

        def available_position?(user_move,array_table)
            row = (user_move[0].to_i) -1
            column = (user_move[2].to_i) -1
            if array_table[row][column] != '_' 

                return false
            else
                return true
            end
        end
    end
    end

    class Player
        attr_reader :name, :symbol

        def initialize(name, symbol)
            @name = name
            @symbol = symbol
        end
    end

    class Table
        attr_reader :array_table

        def initialize()
            @array_table = [['_','_','_'],['_','_','_'],['_','_','_']]
        end

        def print_table()
            @array_table.each do |row|
                puts "| #{row[0]} #{row[1]} #{row[2]} |"
            end
            return "Current state"
        end

        def update_table(move_as_array, player_symbol)
            row = move_as_array[0].to_i - 1
            column = move_as_array[2].to_i - 1
            @array_table[row][column] = player_symbol
        end

        def check_winner()
            # Win cases
            upper_row = @array_table[0]
            middle_row = @array_table[1]
            down_row = @array_table[2]
            left_column = [3.times {}]
        
        end

    end
    
    


include TicTacToe
Game.new()

# alvaro = Player.new('Alvaro','X')
# puts alvaro.name
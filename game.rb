require './player.rb'
require './question.rb'

class Game
  def initialize
    puts "What is player 1's name?"
    player1 = gets.chomp
    @player1 = Player.new(player1)
    puts "What is player 2's name?"
    player2 = gets.chomp
    @player2 = Player.new(player2)
  end

  def makeQuestion
    @newQuestion = Question.new
    puts "----- NEW TURN -----"
    if @player1.turn
      puts "#{@player2.name}: #{@newQuestion.newQuestion}"  
    else 
      puts "#{@player1.name}: #{@newQuestion.newQuestion}"  
    end
  end

  def checkAnswer
    if gets.chomp.to_i == @newQuestion.answer
      if @player1.turn
        puts "YES! You are correct."
        @player1.turn = false
        @player2.turn = true
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        checkWinner
      else
        puts "YES! You are correct."
        @player1.turn = true
        @player2.turn = false
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        checkWinner
      end
    else
      if @player1.turn
        @player1.lives -= 1
        puts "No! You are incorrect."
        @player1.turn = false
        @player2.turn = true
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        checkWinner
      else
        @player2.lives -= 1
        puts "No! You are incorrect."
        @player1.turn = true
        @player2.turn = false
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        checkWinner
      end    
    end
  end

  def checkWinner
    if @player1.lives == 0
      puts "----- GAME OVER -----"
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3 "
      puts "Thank you, play again"
    elsif @player2.lives == 0
      puts "----- GAME OVER -----"
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3 "
      puts "Thank you, play again"
    else
      nextTurn
    end
  end

  def nextTurn
    makeQuestion
    checkAnswer
  end
end
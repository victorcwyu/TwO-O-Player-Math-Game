# It will pick two numbers between 1 and 20 to generate the addition problems.
# It will check the answer

class Question
  attr_reader :newQuestion, :answer

  def initialize
    num1 = rand(1..20)
    num2 = rand(1..20)
    @newQuestion = "What does #{num1} plus #{num2} equal?"
    @answer = num1 + num2
  end
end
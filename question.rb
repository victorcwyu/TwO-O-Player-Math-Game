class Question
  attr_reader :newQuestion, :answer

  def initialize
    num1 = rand(1..20)
    num2 = rand(1..20)
    @newQuestion = "What does #{num1} plus #{num2} equal?"
    @answer = num1 + num2
  end
end
class Question
  def initialize
    @number1 = rand(20) + 1
    @number2 = rand(20) + 1
  end

  def text
    "What does #{@number1} plus #{@number2} equal?"
  end

  def correct_answer
    @number1 + @number2
  end
end

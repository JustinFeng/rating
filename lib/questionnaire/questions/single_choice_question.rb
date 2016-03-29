module Rating
  class SingleChoiceQuestion
    def initialize standard_answer
      @standard_answer = standard_answer
    end

    def check answer
      (answer.nil? || answer[0] != @standard_answer) ? 0 : 1
    end
  end
end

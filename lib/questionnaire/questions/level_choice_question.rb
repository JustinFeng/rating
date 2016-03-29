module Rating
  class LevelChoiceQuestion
    def check answer
      answer.nil? ? 0 : (answer.getbyte(0) - 'A'.getbyte(0) + 1)
    end
  end
end

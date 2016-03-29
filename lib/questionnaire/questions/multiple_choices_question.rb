module Rating
  class MultipleChoicesQuestion
    def initialize standard_answer
      @standard_answer = standard_answer.gsub(/\s+/, '')
    end

    def check answer
      return 0 if answer.nil?
      @standard_answer.chars.reduce(0) { |s, c| s + (answer.include?(c) ? 1 : 0) }
    end
  end
end

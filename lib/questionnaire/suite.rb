require './lib/questionnaire/questions/question_factory'

module Rating
  class Suite
    def initialize range
      @range = range
    end

    def load standard_answers
      @questions = standard_answers[@range].map { |standard_answer| QuestionFactory.create_question standard_answer }
    end

    def check answer
      scores = @questions.zip(answer[@range]).map { |q, a| q.check(a) }
      scores << scores.sum
    end

    def header
      Range.new(1, @questions.size).to_a.join(",") + ",Sum"
    end
  end
end

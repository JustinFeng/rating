require './lib/questionnaire/questions/open_question'
require './lib/questionnaire/questions/single_choice_question'
require './lib/questionnaire/questions/level_choice_question'
require './lib/questionnaire/questions/multiple_choices_question'

module Rating
  class QuestionFactory
    def self.create_question standard_answer
      case standard_answer
        when nil
          OpenQuestion.new
        when /^[A-Z]$/
          SingleChoiceQuestion.new standard_answer
        when /^A=1/
          LevelChoiceQuestion.new
        when /^([A-Z]\s*)+$/
          MultipleChoicesQuestion.new standard_answer
      end
    end
  end
end

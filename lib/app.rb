require 'roo-xls'
require './lib/questionnaire/questionnaire'

module Rating
  class App
    STANDARD_ANSWERS_FILE = './data/standard_answers.xls'
    RESULTS_FILE = './data/results.xls'

    def run
      questionnaire = Questionnaire.new STANDARD_ANSWERS_FILE
      File.open('./output/scores.csv', 'w+') do |f|
        f.puts header(questionnaire.suite_num)
        submitted_results[1..-1].each do |answer|
          score = questionnaire.check(answer)
          f.puts score.unshift(answer.first).join(',')
        end
      end
    end

    private

    def header(suite_num)
      header = 'Id'
      suite_num.times do |num|
        header += ",Suite #{num + 1}"
      end
      header
    end

    def submitted_results
      Roo::Spreadsheet.open(RESULTS_FILE).sheet(0).parse
    end
  end
end

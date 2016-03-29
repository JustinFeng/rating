require 'roo-xls'
require './lib/questionnaire/suite'

module Rating
  class Questionnaire
    def initialize file
      xls = Roo::Spreadsheet.open(file)
      sheet = xls.sheet(0)

      init_suites(sheet)
    end

    def check answer
      @suites.map { |suite| suite.check answer }
    end

    def suite_num
      @suites.size
    end

    private

    def init_suites(sheet)
      start_indices = sheet.row(1).map.with_index { |title, index| title.start_with?('1.') ? index : nil }.compact[1..-1]
      end_indices = start_indices[1..-1].map { |start_index| start_index - 1 } << -1

      @suites = start_indices.zip(end_indices).map { |start_index, end_index| Suite.new(Range.new(start_index, end_index)) }
      @suites.each { |suite| suite.load sheet.row(2) }
    end
  end
end
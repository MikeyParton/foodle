module Options
  class Base
    attr_accessor :options

    def self.all
      @options
    end

    def self.all_as_sym
      @options.map(&:to_sym)
    end

    # Converts it to an array of arrays
    # [0]
    #   [0] 'tradesperson_assistant'
    #   [1] 'Tradesperson's Assistant'
    #
    def self.all_as_select
      @options.map { |x| [x, self.new(x).try(:to_s)] }
    end

    # Converts it for use in a select form
    def self.select_form
      @options.map { |x| [self.new(x).try(:to_s), x] }
    end
  end
end

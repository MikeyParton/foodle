module Options
  module Units

    class AllUnits < Base
      @options = %w(g mg µg kj cal)

      def initialize(option)
        @option = option
      end

      def to_s
        I18n.t @option, @scope = [:options, :units, :all_units]
      end
    end

  end
end

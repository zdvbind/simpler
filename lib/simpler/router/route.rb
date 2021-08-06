module Simpler
  class Router
    class Route

      attr_reader :controller, :action, :path

      def initialize(method, path, controller, action)
        @method = method
        @path = path
        @controller = controller
        @action = action
      end

      def match?(method, path)
        @method == method && path.match(regexp_to_path)
      end

      def regexp_to_path
        Regexp.new("^#{@path.gsub(/:id/, '\d+')}$")
      end

    end
  end
end

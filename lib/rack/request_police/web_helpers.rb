module Rack
  module RequestPolice
    module WebHelpers
      def method_class(method)
        case method
        when 'get'
          'primary'
        when 'post'
          'info'
        when 'patch'
          'warning'
        else
          'danger'
        end
      end

      def environment_name
        environment = ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'development'
        "[#{environment.upcase}]"
      end

      def qparams(options)
        options = options.stringify_keys
        params.merge(options).map do |key, value|
          "#{key}=#{value}"
        end.join("&")
      end

      def root_path
        "#{env['SCRIPT_NAME']}/"
      end
    end
  end
end

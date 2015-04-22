module Rack
  class Angerfist
    def initialize app, config
      @app = app
      @gabba = Gabba::Gabba.new(config[:tracker_id], config[:domain])
      @content_types = config[:content_types]
      @paths = config[:paths]
    end

    def call env
      @env = env
      status, headers, response = @app.call(@env)

      @headers = Rack::Utils::HeaderHash.new(headers)

      if content_type_matches? && path_matches?
        @gabba.page_view(full_path, full_path)
      end

      [ status, headers, response ]
    end

    def content_type_matches?
      return true unless @content_types

      @content_types.include?(@headers['CONTENT-TYPE'])
    end

    def path_matches?
      return true unless @paths

      @paths.any? { |p| @env['PATH_INFO'].include?(p) }
    end

    def full_path
      (@env['PATH_INFO'] + '?' + @env['QUERY_STRING']).chomp('?')
    end
  end
end

module Rack
  class Angerfist
    def initialize app, config
      @app = app
      @gabba = Gabba::Gabba.new(config[:tracker_id], config[:domain])
    end

    def call env
      @env = env
      status, headers, response = @app.call(@env)
      @gabba.page_view(full_path, full_path)

      [ status, headers, response ]
    end

    def full_path
      (@env['PATH_INFO'] + '?' + @env['QUERY_STRING']).chomp('?')
    end
  end
end

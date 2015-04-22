module Rack
  class Angerfist
    def initialize app, config
      @app = app
    end

    def call env
      @env = env
      status, headers, response = @app.call(@env)

      [ status, headers, response ]
    end
  end
end

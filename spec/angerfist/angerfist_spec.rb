require 'spec_helper'

module Rack
  describe Angerfist do
    let :config do
      {
        tracker_id: "UA-xxxxxxx-x",
        domain: "http://test.domain"
      }
    end

    it 'tracks a page view' do
      app = proc{
        [
          200,
          {},
          [
            'Hello, world'
          ]
        ]
      }

      middleware = Angerfist.new(app, config)
      request = Rack::MockRequest.new(middleware)

      expect_any_instance_of(Gabba::Gabba).to receive(:page_view)
      request.get('addresses/address.json', {})
    end
  end
end

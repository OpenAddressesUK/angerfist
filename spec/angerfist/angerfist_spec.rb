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
      app = proc {
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

    it "tracks a page view for the specified content type" do
      app = proc {
        [
          200,
          {'CONTENT-TYPE' => 'application/json'},
          [
            'Hello, world'
          ]
        ]
      }
      content_type =  "application/json"
      config[:content_types] = [ content_type ]
      middleware = Angerfist.new(app, config)
      request = Rack::MockRequest.new(middleware)

      expect_any_instance_of(Gabba::Gabba).to receive(:page_view)
      request.get('addresses/address.json', { "CONTENT-TYPE" => content_type })
    end

    it "doesn't track a page view for an unspecified content type" do
      app = proc {
        [
          200,
          {'CONTENT-TYPE' => 'application/xml'},
          [
            'Hello, world'
          ]
        ]
      }
      content_type =  "application/json"
      config[:content_types] = [ content_type ]
      middleware = Angerfist.new(app, config)
      request = Rack::MockRequest.new(middleware)

      expect_any_instance_of(Gabba::Gabba).to_not receive(:page_view)
      request.get('addresses/address.json', {})
    end
    
  end
end

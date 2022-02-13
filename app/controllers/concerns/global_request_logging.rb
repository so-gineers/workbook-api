# frozen_string_literal: true

# Log request body & header and also the response
module GlobalRequestLogging
  extend ActiveSupport::Concern

  included { around_action :global_request_logging }

  def global_request_logging
    request_ip
    request_url
    http_request_headers
    http_request_params
    begin
      yield
    ensure
      pp(JSON.parse(response.body)) unless response.body.empty?
    end
  end

  private

  def http_request_params
    params.each_key do |key|
      puts([format('%20s', key.to_s), ':', params[key].inspect].join)
    end
  end

  def http_request_headers
    request
      .headers
      .env
      .keys
      .select { |header_name| header_name.match('^HTTP.*|^X-WORKBOOK.*') }
      .each do |key|
        puts([format('%20s', key.to_s), ':', request.headers[key].inspect].join)
      end
  end

  def request_ip
    puts([format('%20s', 'remote ip'.upcase), ':', request.remote_ip].join)
  end

  def request_url
    puts([format('%20s', 'url'.upcase), ':', request.url].join)
  end
end

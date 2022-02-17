# frozen_string_literal: true

# Log request body & header and also the response
module GlobalRequestLogging
  extend ActiveSupport::Concern

  included { around_action :global_request_logging }

  def global_request_logging
    puts([format('%20s', '---' * 10), 'WORKBOOK API REQUEST LOGGER', '---' * 10].join)
    request_ip
    request_url
    puts([format('%20s', '---' * 10), ' request headers', '---' * 10].join)
    http_request_headers
    puts([format('%20s', '---' * 10), ' request parameters ', '---' * 10].join)
    http_request_params
    begin
      yield
    ensure
      unless response.body.empty?
        puts([format('%20s', '---' * 10), ' response body', '---' * 10].join)
        JSON.parse(response.body).each { |key, value| puts([format('%20s', ' : ', key), value].join) }
      end
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

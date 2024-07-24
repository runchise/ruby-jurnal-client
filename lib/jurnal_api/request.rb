require 'openssl'
require 'base64'

module JurnalApi
  # Defines HTTP request methods
  module Request
    # Perform an HTTP GET request
    def get(path, options={}, raw=false, unformatted=false, no_response_wrapper=no_response_wrapper())
      request(:get, path, options, raw, unformatted, no_response_wrapper)
    end

    # Perform an HTTP POST request
    def post(path, options={}, raw=false, unformatted=false, no_response_wrapper=no_response_wrapper())
      request(:post, path, options, raw, unformatted, no_response_wrapper)
    end

    # Perform an HTTP PUT request
    def put(path, options={},  raw=false, unformatted=false, no_response_wrapper=no_response_wrapper())
      request(:put, path, options, raw, unformatted, no_response_wrapper)
    end

    # Perform an HTTP DELETE request
    def delete(path, options={}, raw=false, unformatted=false, no_response_wrapper=no_response_wrapper())
      request(:delete, path, options, raw, unformatted, no_response_wrapper)
    end

    private

    # Perform an HTTP request
    def request(method, path, options, raw=false, unformatted=false, no_response_wrapper=false)
      response = connection(raw).send(method) do |request|
        path = formatted_path(path) unless unformatted
        set_signature(request, method, path)
        case method
        when :get, :delete
          request.url(path, options)
        when :post, :put
          request.path = path
          request.headers['Content-Type'] = 'application/json'
          request.body = options unless options.empty?
        end
      end

      return response if raw
      return response.body if no_response_wrapper
      return Response.create( response.body, {:limit => response.headers['x-ratelimit-limit'].to_i,
                                              :remaining => response.headers['x-ratelimit-remaining'].to_i} )
    end

    def set_signature(request, method, path)
      return if access_token.present?

      hmac_username = client_id;
      hmac_secret = client_secret;
      request_line = "#{method.upcase} '/v2/jurnal/'#{path} HTTP/1.1";
      datetime = Time.now.httpdate
      payload = [datetime, request_line].join("\n")
      digest = OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), hmac_secret, payload)
      signature = Base64.strict_encode64(digest)

      signature = Base64.strict_encode64(OpenSSL::HMAC.digest(digest, hmac_secret, ['date: ', datetime, request_line].join("\n")))
      hmac_header = "hmac username=\"#{hmac_username}\", algorithm=\"hmac-sha256\", headers=\"date request-line\", signature=\"#{signature}\""
      request.headers['Authorization'] = hmac_header
      request.headers['Date'] = datetime
    end

    def formatted_path(path)
      [path, format].compact.join('.')
    end
  end
end

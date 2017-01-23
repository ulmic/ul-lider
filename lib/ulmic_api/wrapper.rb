class UlmicApi::Wrapper
  extend ActiveSupport::Concern
  include Virtus.model

  def self.call(*args)
    new(*args).call
  end

  # url is master stage of ULMIC
  ULMIC_API_BASE_URL = ENV['API_BASE_URL'] || 'http://localhost:3000'
  #ULMIC_API_TOKEN    = ENV['API_TOKEN'] || 'secret'
  ULMIC_API_TOKEN    = 'jsD7Ie7WlIlTXMIA00PsymgQUocI4tUJb7mbTSJ78bF0dCaSV2cqnJoW8GPmhaB0b0dlQcfYSy24gbPOCdM6vf7V5SZJNDlYwdX'

  attribute :endpoint, String
  attribute :params, Hash, default: {}
  attribute :method, Symbol, default: :get
  attribute :body, String, default: ''

  def call
    uri = URI.join("https://ulmic.ru", "api/#{endpoint}")
    encoded_query = CGI.unescape params.to_query
    uri.query = encoded_query if encoded_query.present?
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    headers = { "Authorization" => "Token token=#{ULMIC_API_TOKEN}" }
    request = "Net::HTTP::#{method.to_s.camelize}".constantize.new "#{uri.path}?#{uri.query}", headers
    http.request request
  end
end

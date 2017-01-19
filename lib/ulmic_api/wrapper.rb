class UlmicApi::Wrapper
  extend ActiveSupport::Concern
  include Virtus.model

  def self.call(*args)
    new(*args).call
  end

  # url is master stage of ULMIC
  ULMIC_API_BASE_URL = ENV['API_BASE_URL'] || 'http://localhost:3000'
  #ULMIC_API_TOKEN    = ENV['API_TOKEN'] || 'secret'
  ULMIC_API_TOKEN    = '2r1FFj9BChQSRSJprxNub66tm7Wf1LxRKulBaMmQquqVQv2jdr9SQqKNtKkfJLnnpbk8PsXAeQbIkxd4gooGrh5SMTcaurl4IyB'

  attribute :endpoint, String
  attribute :params, Hash, default: {}
  attribute :method, Symbol, default: :get
  attribute :body, String, default: ''

  def call
    uri = URI.join("https://ulmic.ru", "api/#{endpoint}")
    encoded_query = CGI.unescape params.to_query
    uri.query = encoded_query if encoded_query.present?
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == 'https')
    headers = { "Authorization" => "Token token=#{ULMIC_API_TOKEN}" }
    request = "Net::HTTP::#{method.to_s.camelize}".constantize.new "#{uri.path}?#{uri.query}", headers
    http.request request
  end
end

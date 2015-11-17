require 'net/http'
require 'ostruct'

#FIXME create ulmic/api wrapper
module Ulmic
  module News
    class << self
      def get_last_news
        params = { count: 3, tag: { tag_type: 'link', target_type: 'ActivityLine', title: 'Лидер' } }
        url = URI.parse "http://#{configus.api.ulmic.host}/api/news?#{params.to_query}"
        req = Net::HTTP::Get.new url.to_s
        res = Net::HTTP.start url.host, url.port do |http|
          http.request req
        end
        JSON.parse(res.body).map { |hash| OpenStruct.new(hash) }
      end
    end
  end
end

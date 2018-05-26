require 'json'
require 'net/http'
require 'uri'

module BtsBot
  module Plugin
    class Image
      attr_reader :command, :description

      API_ENDPOINT = 'www.googleapis.com/customsearch/v1'

      def initialize
        @command = :image
        @description = 'Google から適当に画像検索して表示します'

        if ENV['GOOGLE_CSE_ID']
          @cse_id = ENV['GOOGLE_CSE_ID']
        else
          warn '[WARNING] GOOGLE_CSE_ID environment variable is not set properly! !image will not work fine.'
        end

        if ENV['GOOGLE_CSE_API_KEY']
          @cse_api_key = ENV['GOOGLE_CSE_API_KEY']
        else
          warn '[WARNING] GOOGLE_CSE_API_KEY environment variable is not set properly. Image plugin will not work fine.'
        end
      end

      def set_callback(bot)
        bot.command(@command, description: @description) do |e, query|
          invoke(query)
        end
      end

      def invoke(query)
        uri = URI.parse(build_request_uri(query))

        response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
          http.open_timeout = 3
          http.read_timeout = 3
          http.get(uri.request_uri)
        end

        case response
        when Net::HTTPSuccess
          bot_response = JSON.parse(response.body)['items'].sample['link']
        else
          bot_response = "画像 URL の取得に失敗したよ :cry:\n"
          bot_response << "エラーコード: #{response.code}"
          bot_response << "エラーコード: #{response.body}"
        end

        bot_response
      end

      private

      def build_request_uri(search_word)
        params = {
          'key' => @cse_api_key,
          'cx' => @cse_id,
          'searchType' => 'image',
          'safe' => 'high',
          'q' => search_word,
        }
        "https://#{API_ENDPOINT}?#{URI.encode_www_form(params)}"
      end
    end
  end
end

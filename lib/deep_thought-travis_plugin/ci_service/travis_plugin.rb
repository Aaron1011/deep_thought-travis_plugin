require 'httparty'
require 'deep_thought/ci_service/ci_service'

module DeepThought
  module CIService
    class TravisPlugin < DeepThought::CIService::CIService
      def setup?(settings)
        @endpoint = settings['CI_SERVICE_ENDPOINT']
        @access_token = settings['CI_SERVICE_ACCESS_TOKEN']

        true
      end

      def is_branch_green?(app, branch, *args)
        is_green = false

        url = "#{@endpoint}/repos/#{app}/branches/#{branch}"
        url << "?access_token=#{@access_token}" if @access_token
        response = HTTParty.get(url)
        build = JSON.parse(response.body)

        if build['branch']['state'] == 'passing'
          return true
        end
        return false
      end
    end
  end
end

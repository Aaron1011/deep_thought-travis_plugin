require 'deep_thought'
require 'deep_thought-travis_plugin/ci_service/travis_plugin'

module DeepThought
  DeepThought::CIService.register_adapter('travis', DeepThought::CIService::TravisPlugin)
end

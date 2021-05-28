require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rcafe2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    # 레일스의 디폴트 타임존 변경
    # DB로부터 UTC로 저장된 시간을 불러와 표시할 때는 레일스가 config/application.rb 에 저장된 time_zone 값에 맞게 자동으로 변경한 후에 표시한다. 
    # 그러나, DB에 저장할 때도 로컬 타임존에 맞게 저장하려면 config.time_zone = 'Seoul' 아래에 config.active_record.default_timezone = :local와 같이 추가하면 된다.
    config.time_zone = 'Seoul'
  end
end
